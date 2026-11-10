# စွမ်းဆောင်ရည် စီမံကိန်းရေးဆွဲခြင်း - Azure အရင်းအမြစ်ရရှိမှုနှင့် ကန့်သတ်ချက်များ

**အခန်းလမ်းညွှန်မှု:**
- **📚 သင်တန်းအိမ်**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၆ - မတိုင်မီနောက်ခံစစ်ဆေးခြင်းနှင့် စီမံကိန်းရေးဆွဲမှု
- **⬅️ ယခင်အခန်း**: [အခန်း ၅: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **➡️ နောက်တစ်ခန်း**: [SKU ရွေးချယ်မှု](sku-selection.md)
- **🚀 နောက်ဆုံးအခန်း**: [အခန်း ၇: ပြဿနာဖြေရှင်းခြင်း](../chapter-07-troubleshooting/common-issues.md)

## နိဒါန်း

ဒီလက်စွဲစာအုပ်က Azure Developer CLI ဖြင့် တပ်ဆင်မှုမပြုမီ Azure အရင်းအမြစ် စွမ်းဆောင်ရည်ကို စီမံကိန်းရေးဆွဲခြင်းနှင့် စစ်ဆေးခြင်းကို ကူညီပေးပါသည်။ ပမာဏကန့်သတ်ချက်များ၊ ရရှိနိုင်မှုနှင့် ဒေသဆိုင်ရာ ကန့်သတ်ချက်များကို မွမ်းမံလေ့လာပြီး တပ်ဆင်မှုအောင်မြင်စေရန်အတွက် စရိတ်နှင့် စွမ်းဆောင်ရည်ကို ဩဇာပြု လိုက်လံစစ်ဆေးကြည့်ပါ။ အမျိုးမျိုးသော အက်ပလီကေးရှင်း ပုံစံများနှင့် တိုးချဲ့မှုအခြေအနေများအတွက် စွမ်းဆောင်ရည် စီမံကိန်းရေးဆွဲနည်းများကို ပြင်းပြင်းထန်ထန်ကျွမ်းကျင်ပါ။

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဒီလက်စွဲကို ပြီးစီးပြီးနောက် သင်သည်
- Azure ပမာဏကန့်သတ်ချက်များ၊ ကန့်သတ်ချက်များနှင့် ဒေသဆိုင်ရာ ရရှိနိုင်မှု ကန့်သတ်ချက်များကို နားလည်မည်
- တပ်ဆင်မှုမပြုမီ အရင်းအမြစ်ရရှိနိုင်မှုနှင့် စွမ်းဆောင်ရည်စစ်ဆေးနည်းများကို ကျွမ်းကျင်မည်
- စွမ်းဆောင်ရည်အတည်ပြုခြင်းနှင့် စောင့်ကြပ်မှု စနစ်များကို အလိုအလျောက် ဆောင်ရွက်နိုင်မည်
- သင့်လျော်သော အရင်းအမြစ်အရွယ်အစားနဲ့ တိုးချဲ့မှု ကို စဉ်းစားထားသော အက်ပလီကေးရှင်းများ ဒီဇိုင်းဆွဲမည်
- စွမ်းဆောင်ရည် စီမံကိန်းရေးဆွဲမှုမှတဆင့် စရိတ် ညှိနှိုင်းနည်းများ အသုံးချမည်
- ပမာဏသုံးစွဲမှုနှင့် အရင်းအမြစ်ရရှိမှုအတွက် သတိပေးချက်များနှင့် စောင့်ကြပ်မှုကို ဖွဲ့စည်းမည်

## သင်ယူပြီးရရှိမည့် အကျိုးသက်ရောက်မှုများ

ပြီးစီးပြီးနောက် သင်အောက်ပါ အရာများကို အောင်မြင်စွာ လုပ်ဆောင်နိုင်မည်ဖြစ်သည်
- တပ်ဆင်မှုမပြုမီ Azure အရင်းအမြစ် စွမ်းဆောင်ရည်လိုအပ်ချက်များကို ခန့်မှန်းပြီး စစ်ဆေးနိုင်မည်
- စွမ်းဆောင်ရည်စစ်ဆေးခြင်းနှင့် ပမာဏစောင့်ကြပ်မှုအတွက် အလိုအလျောက် စာတမ်းများ ဖန်တီးနိုင်မည်
- ဒေသနှင့် စာရင်းသွင်းမှု ကန့်သတ်ချက်များကို တွက်ချက်ထားသော တိုးချဲ့နိုင်သော ဖွဲ့စည်းမှုများ ဒီဇိုင်းဆွဲမည်
- အလုပ်အမျိုးမျိုးအတွက် စရိတ်သက်သာသော အရင်းအမြစ် အရွယ်အစားချမှတ်မှု နည်းလမ်းများကို အသုံးပြုမည်
- စွမ်းဆောင်ရည်ဆိုင်ရာပြဿနာများဆိုင်ရာ အသိပေးမှုနှင့် ကြိုတင်စောင့်ကြည့်မှုကို ဖွဲ့စည်းမည်
- သင့်လျော်သော စွမ်းဆောင်ရည် ဖြန့်ဝေမှုနဲ့ ဒေသအနှံ့ နေရာတော်တော်များများတွင် တပ်ဆင်မှုများ ရှိစေရန် စီစဉ်နိုင်မည်

## စွမ်းဆောင်ရည် စီမံကိန်းရေးဆွဲခြင်း အရေးကြီးသည်မှာ ငြင်းဆန်၍မရ

> **အတိုင်းအတာ:** ဒီ Bash ဥပမာများကို Azure CLI, `jq` နှင့် ရွေးချယ်ထားသော စာရင်းသွင်းမှု တစ်ခု လိုအပ်သည်။ ၎င်းများသည် ထုတ်ပြန်ထားသော ကမ်းလှမ်းမှုများနှင့် ပမာဏကို စစ်ဆေးပေးမည်ဖြစ်ပြီး ကာကွယ်ထားသည့် စွမ်းဆောင်ရည် သို့မဟုတ် အရင်းအမြစ်များ သိုလှောင်ချက် မဖြစ်ပါ။ သင့်ကိုယ်ပိုင် ပရောဂျက်တွင် စာမျက်နှာများကို သိမ်းဆည်းကာ ပြုပြင်သုံးစွဲပါ—စာတမ်း/ဖိုင်အမည်များသည် ဥပမာများဖြစ်ပြီး သွင်းသည့် ဖိုင်များ မဟုတ်ပါ။ VM ပမာဏကန့်သတ်ချက်များမှာ Container Apps, App Service သို့မဟုတ် Azure OpenAI ပမာဏများတွင် မပါဝင်ပါ။

အက်ပလီကေးရှင်းများတပ်ဆင်မတိုင်မီ သင့်တွင် အောက်ပါအချက်များ အတည်ပြုထားရပါမည်
- လိုအပ်သော အရင်းအမြစ်များအတွက် **လုံလောက်သော ပမာဏကန့်သတ်ချက်များ**
- သင်၏ ရည်ရွယ်ထားတဲ့ ဒေသအတွင်း **အရင်းအမြစ် ရရှိနိုင်မှု**
- သင့်စာရင်းသွင်းမှု အမျိုးအစားအတွက် **ဝန်ဆောင်မှု အဆင့် ရရှိနိုင်မှု**
- မျှော်မှန်းထားသော traffic အတွက် **ကွန်ယက် စွမ်းဆောင်ရည်**
- သင့်လျော်သော အရွယ်အစား ချမှတ်မှုအားဖြင့် **စရိတ် ဇယားကောင်းမွန်မှု**

## 📊 Azure ပမာဏကန့်သတ်ချက်များနှင့် ကန့်သတ်ချက်များ နားလည်ခြင်း

### ကန့်သတ်ချက် အမျိုးအစားများ
1. **စာရင်းသွင်းမှုအခြေခံ ပမာဏများ** - စာရင်းသွင်းမှု တစ်ခုလျှင် အများဆုံး အရင်းအမြစ်များ
2. **ဒေသဆိုင်ရာ ပမာဏများ** - ဒေသတစ်ခုလျှင် အများဆုံး အရင်းအမြစ်များ
3. **အရင်းအမြစ်အမျိုးအစား အကန့်အသတ်များ** - အရင်းအမြစ်အမျိုးအစား တစ်ခုချင်းစီအတွက်ကန့်သတ်ချက်များ
4. **ဝန်ဆောင်မှု အဆင့် ကန့်သတ်ချက်များ** - သင့်ဝန်ဆောင်မှုအစီအစဉ်အပေါ်မူတည်၍ ကန့်သတ်ချက်များ

### ပုံမှန်အရင်းအမြစ် ပမာဏများ
```bash
# Check current quota usage
az vm list-usage --location eastus2 --output table

# Check specific resource quotas
az network list-usages --location eastus2 --output table
az storage account show-usage --location eastus2 --output table
```

## တပ်ဆင်မှုမပြုမီ စွမ်းဆောင်ရည် စစ်ဆေးမှုများ

### အလိုအလျောက် စွမ်းဆောင်ရည် အတည်ပြုမှု စာတမ်း
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

### ဝန်ဆောင်မှုအလိုက် စွမ်းဆောင်ရည် စစ်ဆေးမှုများ

#### App Service စွမ်းဆောင်ရည်
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

#### ဒေတာဘေ့စ် စွမ်းဆောင်ရည်
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

#### Container Apps စွမ်းဆောင်ရည်
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

## 📍 ဒေသဆိုင်ရာ ရရှိနိုင်မှု အတည်ပြုခြင်း

### ဒေသအလိုက် ဝန်ဆောင်မှု ရရှိနိုင်မှု
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

### ဒေသ ရွေးချယ်မှု ဆွေးနွေးချက် ( ဥပမာ )

အောက်ပါ အမှတ်အသားများသည် စူးစမ်းစစ်ဆေးရန် ထောက်ပံ့ချက်များဖြစ်ပြီး၊ လက်ရှိ ဒေသဆိုင်ရာ စျေးနှုန်းများနှင့် အချိန်နွေးထွေးမှု တိုင်းတာမှုများနှင့် နှိုင်းယှဉ်ကြည့်ပေးရန် ဖြစ်သည်။ GDPR သည် ဂျာမဏီ ဒေသကို အထူးလိုအပ်ချက် မထားပါ၊ နိုင်ငံတော်နေရပ်၊ ဝန်ဆောင်မှု လက္ခဏာများနှင့် အဖွဲ့အစည်း/ဥပဒေလိုအပ်ချက်များ တစ်ပြိုင်နက်တည်း သုံးသပ်ရမည်။
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

## 💰 စရိတ် စီမံခန့်ခွဲခြင်းနှင့် ခန့်မှန်းခြင်း

### အရင်းအမြစ် စရိတ် ခန့်မှန်းခြင်း
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

### SKU အကောင်းဆုံးပြုပြင်မှု အကြံပြုချက်များ
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

## 🚀 အလိုအလျောက် မတိုင်ခင် စစ်ဆေးမှုများ

### စုံလင်သော မတိုင်ခင် စစ်ဆေးမှု စာတမ်း
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

### ဖိုင်ဖွဲ့စည်းမှု နမူနာ
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

## 📈 တပ်ဆင်စဉ် စွမ်းဆောင်ရည် စောင့်ကြည့်ခြင်း

### အချိန်အမှန် စွမ်းဆောင်ရည် စောင့်ကြည့်ခြင်း
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

## 🔗 AZD နှင့် ပေါင်းစည်းမှု

### azure.yaml အတွက် မတိုင်ခင် ဟုတ်များ ထည့်သွင်းခြင်း
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

## အကောင်းဆုံး ကျင့်သုံးနည်းများ

1. **ဒေသအသစ်များတွင် တပ်ဆင်မပြုမီ စွမ်းဆောင်ရည် စစ်ဆေးမှုများ အမြဲပြုလုပ်ပါ**
2. **ပမာဏသုံးစွဲမှုကို ပုံမှန် စောင့်ကြည့်ပါ** 
3. **အနာဂတ် စွမ်းဆောင်ရည်လိုအပ်ချက်များအတွက် စီမံကိန်းရေးဆွဲပါ**
4. **စရိတ် ခန့်မှန်းTools များကို အသုံးပြု၍ ဘဏ်ချိန်ပြတ်မှုကို ရှောင်ရွားပါ**
5. **သင့်အသင်းအတွက် စွမ်းဆောင်ရည်လိုအပ်ချက်များကို စာတမ်းတင်ပါ**
6. **CI/CD ပိုင်းလိုင်းများတွင် စွမ်းဆောင်ရည် အတည်ပြုမှု ကို အလိုအလျောက် ဆောင်ရွက်ပါ**
7. **ဒေသဆိုင်ရာ failover စွမ်းဆောင်ရည် လိုအပ်ချက်များကိုဖြစ်စဉ်တည် ယူပါ**

## နောက်တစ်ဆင့်များ

- [SKU ရွေးချယ်ခြင်း လမ်းညွှန်](sku-selection.md) - အကောင်းဆုံး ဝန်ဆောင်မှုအဆင့်များ ရွေးချယ်ပါ
- [မတိုင်ခင် စစ်ဆေးမှုများ](preflight-checks.md) - အလိုအလျောက် အတည်ပြု စာတမ်းများ
- [အကျိုးပြု အချက်အလက်များစာရွက်](../../resources/cheat-sheet.md) - လျင်မြန် သုံးသပ်ကိရိယာများ
- [အဓိပ္ပါယ်အဘိဓာန်](../../resources/glossary.md) - စကားလုံးများနှင့် အဓိပ္ပါယ်များ

## အပိုဆောင်း အရင်းအမြစ်များ

- [Azure စာရင်းသွင်းမှု ကန့်သတ်ချက်များ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure စျေးနှုန်းတွက်ချက်ကိရိယာ](https://azure.microsoft.com/pricing/calculator/)
- [Azure စရိတ်စီမံခန့်ခွဲမှု](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure ဒေသဆိုင်ရာ ရရှိနိုင်မှု](https://azure.microsoft.com/global-infrastructure/services/)

---

**လမ်းညွှန်မှု**
- **ယခင် သင်ခန်းစာ**: [ပြဿနာရှာဖွေရေး လမ်းညွှန်](../chapter-07-troubleshooting/debugging.md)

- **နောက်ထပ် သင်ခန်းစာ**: [SKU ရွေးချယ်မှု](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->