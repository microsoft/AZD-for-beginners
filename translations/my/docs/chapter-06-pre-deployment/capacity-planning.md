# ပြန်လည်စီမံခြင်း (Capacity Planning) - Azure အရင်းအမြစ် ရရှိနိုင်မှုနှင့် အကန့်အသတ်များ

**Chapter Navigation:**
- **📚 Course Home**: [AZD အစပြုသူများအတွက်](../../README.md)
- **📖 Current Chapter**: အခန်း ၆ - တပ်ဆင်ခြင်းမပြုမီ အတည်ပြုခြင်းနှင့် စီမံရေးပညာ
- **⬅️ Previous Chapter**: [အခန်း ၅: မျိုးစုံ-အေးဂျင့် AI ဖြေရှင်းချက်များ](../../examples/retail-scenario.md)
- **➡️ Next**: [SKU ရွေးချယ်ရေး](sku-selection.md)
- **🚀 Next Chapter**: [အခန်း ၇: ပြဿနာရှာဖွေခြင်း](../chapter-07-troubleshooting/common-issues.md)

## နိဒါန်း

ဒီလက်စွဲစာအုပ်သည် Azure Developer CLI ဖြင့် တပ်ဆင်မှုများမပြုမီ Azure အရင်းအမြစ်များ၏ စွမ်းရည်များကို စီမံရန်နှင့် အတည်ပြုရန် ကူညီပေးပါသည်။ ကောင်တာများ၊ ရရှိနိုင်မှုနှင့် ဒေသဆိုင်ရာ ကန့်သတ်ချက်များကို ဆန်းစစ်၍ အောင်မြင်စွာ တပ်ဆင်နိုင်ရန်နှင့် ကုန်ကျစရိတ် နှင့် အလုပ်လုပ်ဆောင်မှုကို ထိရောက်စွာ တိုးတက်အောင် စီမံပါ။ အမျိုးအစားတစ်မျိုးစီအတွက် အရင်းအမြစ် စီမံခန့်ခွဲမှုနည်းဗျူဟာများနှင့် မျှဝေသင်ယူမှုများကို ကျွမ်းကျင်ရမည်။

## သင်ယူရန် ရည်ရွယ်ချက်များ

ဒီလက်စွဲစာအုပ်ကိုပြီးမြောက်သည်နှင့်:
- Azure ကော်တာ၊ အကန့်အသတ်များနှင့် ဒေသဆိုင်ရာ ရရှိနိုင်မှု ကန့်သတ်ချက်များကို နားလည်နိုင်မည်
- တပ်ဆင်ချက်မပြုမီ အရင်းအမြစ် ရရှိနိုင်မှုနှင့် စွမ်းရည်ကို စစ်ဆေးရန် နည်းလမ်းများကို ကျွမ်းကျင်နိုင်မည်
- စွမ်းရည်အတည်ပြုခြင်းနှင့် ကြီးကြပ်မှုအလိုအAutomated ကိရိယာများကို အကောင်အထည်ဖော်နိုင်မည်
- အရင်းအမြစ်အရွယ်အစားနှင့် စုပ်ယူမှုအတွက် သင့်တော်သော application ဒီဇိုင်းရေးဆွဲနိုင်မည်
- ဉာဏ်ကြီးစွာ စွမ်းရည် စီမံကိန်းဖြင့် ကုန်ကျစရိတ် ထိန်းချုပ်နိုင်မည်
- ကော်တာ အသုံးပြုမှုနှင့် အရင်းအမြစ် ရရှိနိုင်မှုအတွက် အချက်ပေးစနစ်နှင့် ကြီးကြပ်မှု ကို ပြင်ဆင်နိုင်မည်

## သင်ယူပြီးရလဒ်များ

ပြီးမြောက်ချိန်တွင် သင့်တွင်နိုင်မည့်အရာများမှာ -
- တပ်ဆင်ခြင်းမပြုမီ Azure အရင်းအမြစ် စွမ်းရည်လိုအပ်ချက်များကို ခန့်မှန်း၍ အတည်ပြုနိုင်ခြင်း
- စွမ်းရည်စစ်ဆေးမှုနှင့် ကော်တာ ကြီးကြပ်မှု အလိုအAutomated စာ scripts များ ဖန်တီးနိုင်ခြင်း
- ဒေသနှင့် စာရင်းသွင်းမှု အကန့်အသတ်များကို ထည့်သွင်းစဉ်းစားသည့် တိုးချဲ့နိုင်သော အင်အားများဒီဇိုင်းရေးဆွဲနိုင်ခြင်း
- အလုပ်ဆောင်မှုအမျိုးအစားအလိုက် အကောင်းဆုံး အရင်းအမြစ် အရွယ်အစား များကို အကောင်အထည်ဖော်နိုင်ခြင်း
- စွမ်းရည်ဆိုင်ရာ ပြဿနာများအတွက် ကြိုတင်ကြည့်ရှု၍ ကြိုတင်အသိပေးခြင်းနှင့် ကြီးကြပ်မှု ပြန်လည်ချိန်ညှိနိုင်ခြင်း
- စွမ်းရည် သက်ဆိုင်ရာ ဂရပ်များနှင့် ပြဿနာများကို ကြိုတင်စီမံ၍ မျိုးစုံဒေသတစ်ခုလျှင် တပ်ဆင်နိုင်မှု စီမံချက်ရေးဆွဲနိုင်ခြင်း

## ယခုအားလုံးတွင် စီမံခန့်ခွဲမှု အရေးပါတော့လို့ ဘာကြောင့်လဲ

အက်ပလီကေးရှင်းများကို တပ်ဆင်ခင်တွင် သေချာစေရမှာက -
- လိုအပ်သော အရင်းအမြစ်များအတွက် **လုံလောက်သော ကော်တာများ**
- ရည်ရွယ်ထားသော ဒေသတွင် **အရင်းအမြစ်ရရှိနိုင်မှု**
- သင်၏ စာရင်းသွင်းမှုအမျိုးအစားအတွက် **ဝန်ဆောင်မှုပုံစံ အဆင့် ရရှိနိုင်မှု**
- မျှော်မှန်းထားသော traffic အတွက် **ကွန်ယက် စွမ်းအင်**
- သင့်တော်သော အရွယ်အစားမှတဆင့် **ကုန်ကျစရိတ် ထိရောက်မှု**

## 📊 Azure ကော်တာများနှင့် အကန့်အသတ်များကို နားလည်ခြင်း

### အကန့်အသတ် အမျိုးအစားများ
1. **စာရင်းသွင်းမှု-အဆင့် ကော်တာများ** - စာရင်းသွင်းမှုအလိုက် အများဆုံး အရင်းအမြစ်များ
2. **ဒေသ-အဆင့် ကော်တာများ** - ဒေသတစ်ခုလျှင် အများဆုံး အရင်းအမြစ်များ
3. **အရင်းအမြစ်-ပစ္စည်း ထူးခြား အကန့်အသတ်များ** - ထူးခြားအရင်းအမြစ်များအတွက် ကန့်သတ်ချက်များ
4. **ဝန်ဆောင်မှုပုံစံ အကန့်အသတ်များ** - သင်၏ ဝန်ဆောင်မှုပလန်အပေါ် ရှိသည့် ကန့်သတ်ချက်များ

### ပုံမှန် အရင်းအမြစ် ကော်တာများ
```bash
# လက်ရှိ ကုတ်တာ အသုံးပြုမှုကို စစ်ဆေးပါ
az vm list-usage --location eastus2 --output table

# သတ်မှတ်ထားသော အရင်းအမြစ် ကုတ်တာများကို စစ်ဆေးပါ
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## တပ်ဆင်ခြင်းမပြုမီ စွမ်းရည် စစ်ဆေးချက်များ

### အလိုအလျောက် စွမ်းရည် အတည်ပြု စာကြောင်း
```bash
#!/bin/bash
# capacity-check.sh - တပ်ဆင်မီ Azure စွမ်းဆောင်ရည်ကို စစ်ဆေးရန်

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# ခွင့်ပမာဏ (quota) အသုံးပြုမှုကို စစ်ဆေးရန် လုပ်ဆောင်ချက်
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

# မျိုးစုံသော အရင်းအမြစ် ခွင့်ပမာဏများကို စစ်ဆေးပါ
check_quota "compute" 4      # vCPU 4 လိုအပ်သည်
check_quota "storage" 2      # သိုလှောင်မှု အကောင့် 2 လိုအပ်သည်
check_quota "network" 1      # virtual network 1 လိုအပ်သည်

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### ဝန်ဆောင်မှုအလိုက် စွမ်းရည် စစ်ဆေးချက်များ

#### App Service စွမ်းရည်
```bash
# App Service Plan ရရှိနိုင်မှုကို စစ်ဆေးပါ
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # ဒေသအတွင်း ရရှိနိုင်သည့် SKU များကို စစ်ဆေးပါ
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # အခြားဒေသများကို အကြံပြုပါ
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # လက်ရှိ အသုံးပြုမှုကို စစ်ဆေးပါ
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# အသုံးပြုမှု
check_app_service_capacity "eastus2" "P1v3"
```

#### ဒေတာဘေ့စ် စွမ်းရည်
```bash
# PostgreSQL စွမ်းရည်ကို စစ်ဆေးပါ
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # SKU ရရှိနိုင်မှုကို စစ်ဆေးပါ
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # ရရှိနိုင်သော SKU များကို ပြပါ
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB စွမ်းရည်ကို စစ်ဆေးပါ
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # ဒေသ ရရှိနိုင်မှုကို စစ်ဆေးပါ
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # လိုအပ်ပါက serverless ပံ့ပိုးမှု ရှိမရှိ စစ်ဆေးပါ
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

#### Container Apps စွမ်းရည်
```bash
# Container Apps စွမ်းရည်ကို စစ်ဆေးပါ
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Container Apps ကို အဆိုပါ ဒေသတွင် အသုံးပြုနိုင်/ရနိုင်သလား စစ်ဆေးပါ
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # လက်ရှိ ပတ်ဝန်းကျင် အရေအတွက်ကို စစ်ဆေးပါ
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps တွင် ဒေသတစ်ခုလျှင် ပတ်ဝန်းကျင် 15 ခုအထိ ကန့်သတ်ထားသည်
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # အသုံးပြုနိုင်သော ဒေသများကို ပြပါ
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
# ဒေသအလိုက် ဝန်ဆောင်မှုရရှိနိုင်မှုကို စစ်ဆေးပါ
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

# ဝန်ဆောင်မှုအားလုံးကို စစ်ဆေးပါ
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### ဒေသ ရွေးချယ်မှု အကြံပြုချက်များ
```bash
# လိုအပ်ချက်များအရ အကောင်းဆုံး ဒေသများကို အကြံပြုပါ
recommend_region() {
    local requirements=$1  # "သက်သာစျေး" | "စွမ်းဆောင်ရည်" | "လိုက်နာမှု"
    
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

## 💰 ကုန်ကျစရိတ် စီမံမှုနှင့် ခန့်မှန်းချက်

### အရင်းအမြစ် ကုန်ကျစရိတ် ခန့်မှန်းချက်
```bash
# တပ်ဆင်မှုကုန်ကျစရိတ် ခန့်မှန်းခြင်း
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # ခန့်မှန်းရန် ယာယီ ရင်းမြစ်အုပ်စု တည်ဆောက်ခြင်း
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # အတည်ပြုမုဒ်ဖြင့် အင်ဖရာစထရပ်ချာ တပ်ဆင်ခြင်း
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # ယာယီ ရင်းမြစ်အုပ်စုကို ရှင်းလင်းဖျက်ပစ်ခြင်း
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU တစ်သီးတစ်ချက် ထိရောက်စွာ ရွေးချယ်ရန် အကြံပြုချက်များ
```bash
# လိုအပ်ချက်များအရ အကောင်းဆုံး SKU များကို အကြံပြုပါ
recommend_sku() {
    local service=$1
    local workload_type=$2  # "ဖွံ့ဖြိုးရေး" | "စမ်းသပ်" | "ထုတ်လုပ်မှု"
    
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

## 🚀 အလိုအလျောက် တပ်ဆင်မှုမတိုင်မီ စစ်ဆေးချက်များ

### ပြည့်စုံသော Pre-Flight Script
```bash
#!/bin/bash
# preflight-check.sh - တပ်ဆင်မတိုင်မီ အပြည့်အစုံ စစ်ဆေးခြင်း

set -e

# ဆက်တင်များ
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# အထွက်အတွက် အရောင်များ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # အရောင်မရှိ

# မှတ်တမ်းရေး လုပ်ဆောင်ချက်များ
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# ဆက်တင်များ โหลดခြင်း
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

# စစ်ဆေးချက် ၁: အတည်ပြုခြင်း
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# စစ်ဆေးချက် ၂: ဒေသအလိုက် ရရှိနိုင်မှု
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# စစ်ဆေးချက် ၃: ကိုတာ အတည်ပြုခြင်း
log_info "Checking quota availability..."

# vCPU ကိုတာ
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

# သိုလှောင်မှုအကောင့် ကိုတာ
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

# စစ်ဆေးချက် ၄: ဝန်ဆောင်မှု ရရှိနိုင်မှု
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

# စစ်ဆေးချက် ၅: ကွန်ယက် စွမ်းရည်
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

# စစ်ဆေးချက် ၆: အရင်းအမြစ် အမည် အတည်ပြုခြင်း
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# စစ်ဆေးချက် ၇: ကုန်ကျစရိတ် ခန့်မှန်းခြင်း
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

# စစ်ဆေးချက် ၈: ပုံစံ အတည်ပြုခြင်း
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

# နောက်ဆုံး အကျဉ်းချုပ်
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### ဖော်မတ် ဖိုင် နမူနာ
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

## 📈 တပ်ဆင်မှုအတွင်း စွမ်းရည် ကြီးကြပ်မှု

### အချိန်နှင့်တပြေးညီ စွမ်းရည် ကြီးကြပ်မှု
```bash
# တပ်ဆင်မှုအချိန်တွင် စွမ်းဆောင်ရည်ကို စောင့်ကြည့်ပါ
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးပါ
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
        
        # လက်ရှိ အရင်းအမြစ် အသုံးပြုမှုကို စစ်ဆေးပါ
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD နှင့် ပေါင်းစည်းခြင်း

### azure.yaml ထဲသို့ Pre-Flight Hooks ထည့်ရန်
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

## အကောင်းဆုံး လေ့လာသင်ယူရန် ကမ်းလှမ်းချက်များ

1. **အသစ်ဒေသသို့ တပ်ဆင်မပြုမီ အမြဲ စွမ်းရည် စစ်ဆေးပါ**
2. **ကော်တာ အသုံးပြုမှုကို ပုံမှန်ကြီးကြပ်ပါ** surprises မဖြစ်စေဖို့
3. **အနာဂတ်တိုးချဲ့မှုအတွက် စီမံချက်ရေးပါ**
4. **ဘီလ်မိုးးများမကြုံရအောင် ကုန်ကျစရိတ် ခန့်မှန်း ဆော့ဝဲများကို အသုံးပြုပါ**
5. **အသင်းအဖွဲ့အတွက် စွမ်းရည် လိုအပ်ချက်များကို မှတ်တမ်းတင်ထားပါ**
6. **CI/CD လမ်းကြောင်းများတွင် စွမ်းရည် အတည်ပြုခြင်းကို အလိုအAutomated အဖြစ် ထည့်သွင်းပါ**
7. **ဒေသဆိုင်ရာ failover စွမ်းရည် လိုအပ်ချက်များကို စဉ်းစားပါ**

## နောက်ဆက်တွဲ အဆင့်များ

- [SKU ရွေးချယ်ရေး လမ်းညွှန်](sku-selection.md) - ဝန်ဆောင်မှုပုံစံများကို အကောင်းဆုံးရွေးချယ်ရန်
- [Pre-flight စစ်ဆေးချက်များ](preflight-checks.md) - အလိုအAutomated အတည်ပြု စာကြောင်းများ
- [Cheat Sheet](../../resources/cheat-sheet.md) - အမြန်ဖော်ပြချက် ညွှန်ကြားချက်များ
- [Glossary](../../resources/glossary.md) - အသုံးအနှုန်းများနှင့် အဓိပ္ပာယ်များ

## ထပ်ဆင့် အရင်းအမြစ်များ

- [Azure Subscription Limits](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Cost Management](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure Regional Availability](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigation**
- **Previous Lesson**: [ဒေဘတ်ဂ်ပြုနည်း လမ်းညွှန်](../chapter-07-troubleshooting/debugging.md)

- **Next Lesson**: [SKU ရွေးချယ်ရေး](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
တာဝန်မယူခြင်း။

ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှုဖြစ်သည့် [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားပေမယ့် အလိုအလျောက်ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုလျော့နည်းမှုများ ဖြစ်ပေါ်နိုင်ကြောင်း ကျေးဇူးပြု၍ သိရှိပါ။ မူရင်းစာရွက်စာတမ်းကို မူရင်းဘာသာစကားဖြင့် ရေးသားထားသည့် အရာကို အာဏာပိုင်ရင်းမြစ်အဖြစ် သတ်မှတ်စဉ်းစားသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူသား ပရော်ဖက်ရှင်နယ် ဘာသာပြန်သူမှ ပြန်လည်ဘာသာပြန်ထားခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းဖွယ်အဓိပ္ပာယ်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မရှိပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->