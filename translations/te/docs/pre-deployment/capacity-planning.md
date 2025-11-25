<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "133c6f0d02c698cbe1cdb5d405ad4994",
  "translation_date": "2025-11-25T07:55:46+00:00",
  "source_file": "docs/pre-deployment/capacity-planning.md",
  "language_code": "te"
}
-->
# సామర్థ్య ప్రణాళిక - Azure వనరుల లభ్యత మరియు పరిమితులు

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ఫర్ బిగినర్స్](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: చాప్టర్ 6 - ప్రీ-డిప్లాయ్‌మెంట్ వాలిడేషన్ & ప్రణాళిక
- **⬅️ గత చాప్టర్**: [చాప్టర్ 5: మల్టీ-ఏజెంట్ AI సొల్యూషన్స్](../../examples/retail-scenario.md)
- **➡️ తదుపరి**: [SKU సెలక్షన్](sku-selection.md)
- **🚀 తదుపరి చాప్టర్**: [చాప్టర్ 7: ట్రబుల్‌షూటింగ్](../troubleshooting/common-issues.md)

## పరిచయం

ఈ సమగ్ర గైడ్ మీకు Azure Developer CLI తో డిప్లాయ్ చేయడానికి ముందు Azure వనరుల సామర్థ్యాన్ని ప్రణాళిక చేయడం మరియు ధృవీకరించడం ఎలా చేయాలో సహాయపడుతుంది. కోటాలు, లభ్యత మరియు ప్రాంతీయ పరిమితులను అంచనా వేయడం ద్వారా ఖర్చులు మరియు పనితీరును మెరుగుపరుస్తూ విజయవంతమైన డిప్లాయ్‌మెంట్‌లను నిర్ధారించండి. వివిధ అప్లికేషన్ ఆర్కిటెక్చర్‌లు మరియు స్కేలింగ్ పరిస్థితుల కోసం సామర్థ్య ప్రణాళిక సాంకేతికతలను నేర్చుకోండి.

## అభ్యాస లక్ష్యాలు

ఈ గైడ్‌ను పూర్తి చేయడం ద్వారా, మీరు:
- Azure కోటాలు, పరిమితులు మరియు ప్రాంతీయ లభ్యత పరిమితులను అర్థం చేసుకోగలరు
- డిప్లాయ్‌మెంట్‌కు ముందు వనరుల లభ్యత మరియు సామర్థ్యాన్ని తనిఖీ చేయడం కోసం సాంకేతికతలను నేర్చుకోగలరు
- ఆటోమేటెడ్ సామర్థ్య ధృవీకరణ మరియు మానిటరింగ్ వ్యూహాలను అమలు చేయగలరు
- సరైన వనరుల పరిమాణం మరియు స్కేలింగ్ పరిగణనలతో అప్లికేషన్‌లను డిజైన్ చేయగలరు
- తెలివైన సామర్థ్య ప్రణాళిక ద్వారా ఖర్చు ఆప్టిమైజేషన్ వ్యూహాలను అమలు చేయగలరు
- కోటా వినియోగం మరియు వనరుల లభ్యత కోసం అలర్ట్‌లు మరియు మానిటరింగ్‌ను కాన్ఫిగర్ చేయగలరు

## అభ్యాస ఫలితాలు

ఈ గైడ్‌ను పూర్తి చేసిన తర్వాత, మీరు:
- డిప్లాయ్‌మెంట్‌కు ముందు Azure వనరుల సామర్థ్య అవసరాలను అంచనా వేసి ధృవీకరించగలరు
- సామర్థ్య తనిఖీ మరియు కోటా మానిటరింగ్ కోసం ఆటోమేటెడ్ స్క్రిప్ట్‌లను సృష్టించగలరు
- ప్రాంతీయ మరియు సబ్‌స్క్రిప్షన్ పరిమితులను పరిగణనలోకి తీసుకునే స్కేలబుల్ ఆర్కిటెక్చర్‌లను డిజైన్ చేయగలరు
- వివిధ వర్క్‌లోడ్ రకాల కోసం ఖర్చు-సమర్థవంతమైన వనరుల పరిమాణం వ్యూహాలను అమలు చేయగలరు
- సామర్థ్య సంబంధిత సమస్యల కోసం ప్రాక్టివ్ మానిటరింగ్ మరియు అలర్టింగ్‌ను కాన్ఫిగర్ చేయగలరు
- సరైన సామర్థ్య పంపిణీతో మల్టీ-రీజన్ డిప్లాయ్‌మెంట్‌లను ప్రణాళిక చేయగలరు

## సామర్థ్య ప్రణాళిక ఎందుకు ముఖ్యమైంది

అప్లికేషన్‌లను డిప్లాయ్ చేయడానికి ముందు, మీరు నిర్ధారించాలి:
- అవసరమైన వనరుల కోసం **తగిన కోటాలు**
- మీ లక్ష్య ప్రాంతంలో **వనరుల లభ్యత**
- మీ సబ్‌స్క్రిప్షన్ రకం కోసం **సర్వీస్ టియర్ లభ్యత**
- **నెట్‌వర్క్ సామర్థ్యం** ఆశించిన ట్రాఫిక్ కోసం
- **ఖర్చు ఆప్టిమైజేషన్** సరైన పరిమాణం ద్వారా

## 📊 Azure కోటాలు మరియు పరిమితులను అర్థం చేసుకోవడం

### పరిమితుల రకాలు
1. **సబ్‌స్క్రిప్షన్-లెవల్ కోటాలు** - ప్రతి సబ్‌స్క్రిప్షన్‌కు గరిష్ట వనరులు
2. **ప్రాంతీయ కోటాలు** - ప్రతి ప్రాంతానికి గరిష్ట వనరులు
3. **వనరుల-స్పెసిఫిక్ పరిమితులు** - వ్యక్తిగత వనరుల రకాల కోసం పరిమితులు
4. **సర్వీస్ టియర్ పరిమితులు** - మీ సర్వీస్ ప్లాన్ ఆధారంగా పరిమితులు

### సాధారణ వనరుల కోటాలు
```bash
# ప్రస్తుత కోటా వినియోగాన్ని తనిఖీ చేయండి
az vm list-usage --location eastus2 --output table

# నిర్దిష్ట వనరుల కోటాలను తనిఖీ చేయండి
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## ప్రీ-డిప్లాయ్‌మెంట్ సామర్థ్య తనిఖీలు

### ఆటోమేటెడ్ సామర్థ్య ధృవీకరణ స్క్రిప్ట్
```bash
#!/bin/bash
# capacity-check.sh - మైక్రోసాఫ్ట్ ఆజూర్ సామర్థ్యాన్ని డిప్లాయ్‌మెంట్‌కు ముందు ధృవీకరించండి

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# కోటా వినియోగాన్ని తనిఖీ చేయడానికి ఫంక్షన్
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

# వివిధ వనరుల కోటాలను తనిఖీ చేయండి
check_quota "compute" 4      # 4 vCPUs అవసరం
check_quota "storage" 2      # 2 స్టోరేజ్ అకౌంట్లు అవసరం
check_quota "network" 1      # 1 వర్చువల్ నెట్‌వర్క్ అవసరం

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### సర్వీస్-స్పెసిఫిక్ సామర్థ్య తనిఖీలు

#### యాప్ సర్వీస్ సామర్థ్యం
```bash
# యాప్ సర్వీస్ ప్లాన్ లభ్యతను తనిఖీ చేయండి
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # ప్రాంతంలో అందుబాటులో ఉన్న SKUలను తనిఖీ చేయండి
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
    
    # SKU అందుబాటులో ఉందో లేదో తనిఖీ చేయండి
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
    
    # ప్రాంతం అందుబాటులో ఉందో లేదో తనిఖీ చేయండి
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

#### కంటైనర్ యాప్స్ సామర్థ్యం
```bash
# కంటైనర్ యాప్స్ సామర్థ్యాన్ని తనిఖీ చేయండి
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # కంటైనర్ యాప్స్ ప్రాంతంలో అందుబాటులో ఉందో లేదో తనిఖీ చేయండి
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # ప్రస్తుత పర్యావరణ సంఖ్యను తనిఖీ చేయండి
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # కంటైనర్ యాప్స్‌కు ప్రతి ప్రాంతంలో 15 పర్యావరణాల పరిమితి ఉంది
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

### ప్రాంతం ద్వారా సర్వీస్ లభ్యత
```bash
# ప్రాంతాల వ్యాప్తంగా సేవల లభ్యతను తనిఖీ చేయండి
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

### ప్రాంతం ఎంపిక సిఫార్సులు
```bash
# అవసరాల ఆధారంగా ఉత్తమమైన ప్రాంతాలను సిఫారసు చేయండి
recommend_region() {
    local requirements=$1  # "తక్కువ ఖర్చు" | "ప్రదర్శన" | "అనుగుణత"
    
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

### వనరుల ఖర్చు అంచనా
```bash
# మోహరింపు ఖర్చులను అంచనా వేయండి
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # అంచనా కోసం తాత్కాలిక వనరుల సమూహాన్ని సృష్టించండి
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # ధృవీకరణ మోడ్‌లో మౌలిక సదుపాయాలను మోహరించండి
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # తాత్కాలిక వనరుల సమూహాన్ని శుభ్రం చేయండి
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
# అవసరాల ఆధారంగా ఉత్తమ SKUs ను సిఫారసు చేయండి
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

## 🚀 ఆటోమేటెడ్ ప్రీ-ఫ్లైట్ తనిఖీలు

### సమగ్ర ప్రీ-ఫ్లైట్ స్క్రిప్ట్
```bash
#!/bin/bash
# preflight-check.sh - మునుపటి మోహరింపు ధృవీకరణ పూర్తి చేయండి

set -e

# కాన్ఫిగరేషన్
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# అవుట్‌పుట్ కోసం రంగులు
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # రంగు లేదు

# లాగింగ్ ఫంక్షన్లు
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

# తనిఖీ 1: ధృవీకరణ
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# తనిఖీ 2: ప్రాంతీయ లభ్యత
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

# నిల్వ ఖాతా కోటా
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

# తనిఖీ 4: సేవా లభ్యత
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

# తనిఖీ 6: వనరుల పేరు ధృవీకరణ
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

## 📈 డిప్లాయ్‌మెంట్ సమయంలో సామర్థ్య మానిటరింగ్

### రియల్-టైమ్ సామర్థ్య మానిటరింగ్
```bash
# మోనిటర్ సామర్థ్యాన్ని డిప్లాయ్‌మెంట్ సమయంలో
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

### azure.yamlకు ప్రీ-ఫ్లైట్ హుక్స్ జోడించండి
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

1. **ప్రాంతాల కొత్త ప్రాంతాలకు డిప్లాయ్ చేయడానికి ముందు సామర్థ్య తనిఖీలు** తప్పనిసరిగా చేయండి
2. **కోటా వినియోగాన్ని క్రమంగా మానిటర్ చేయండి** అనుకోని సమస్యలను నివారించండి
3. **వృద్ధి కోసం ప్రణాళిక చేయండి** భవిష్యత్తు సామర్థ్య అవసరాలను తనిఖీ చేయడం ద్వారా
4. **ఖర్చు అంచనా సాధనాలను ఉపయోగించండి** బిల్లింగ్ షాక్‌ను నివారించండి
5. **మీ టీమ్ కోసం సామర్థ్య అవసరాలను డాక్యుమెంట్ చేయండి**
6. **CI/CD పైప్‌లైన్‌లలో ఆటోమేటెడ్ సామర్థ్య ధృవీకరణను అమలు చేయండి**
7. **ప్రాంతీయ ఫెయిలోవర్ సామర్థ్య అవసరాలను పరిగణనలోకి తీసుకోండి**

## తదుపరి దశలు

- [SKU సెలక్షన్ గైడ్](sku-selection.md) - ఆప్టిమల్ సర్వీస్ టియర్‌లను ఎంచుకోండి
- [ప్రీ-ఫ్లైట్ తనిఖీలు](preflight-checks.md) - ఆటోమేటెడ్ ధృవీకరణ స్క్రిప్ట్‌లు
- [చీట్ షీట్](../../resources/cheat-sheet.md) - త్వరిత సూచన ఆదేశాలు
- [గ్లోసరీ](../../resources/glossary.md) - పదాలు మరియు నిర్వచనాలు

## అదనపు వనరులు

- [Azure సబ్‌స్క్రిప్షన్ పరిమితులు](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure ప్రైసింగ్ కాలిక్యులేటర్](https://azure.microsoft.com/pricing/calculator/)
- [Azure ఖర్చు నిర్వహణ](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure ప్రాంతీయ లభ్యత](https://azure.microsoft.com/global-infrastructure/services/)

---

**నావిగేషన్**
- **గత పాఠం**: [డీబగ్గింగ్ గైడ్](../troubleshooting/debugging.md)

- **తదుపరి పాఠం**: [SKU సెలక్షన్](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:  
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->