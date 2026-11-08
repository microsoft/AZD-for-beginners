# ശേഷി പദ്ധതിയിടൽ - അസ്യൂർ റിസോഴ്‌സ് ലഭ്യതയും പരിമിതികളും

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD ആരംഭക്കാർക്കായി](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 6 - പ്രീ-ഡിപ്ലോയ്മെന്റ് സാധൂകരിക്കൽ & പദ്ധതി തയ്യാറാക്കൽ
- **⬅️ മുമ്പത്തെ അദ്ധ്‌യായം**: [അദ്ധ്യായം 5: മൾട്ടി ഏജന്റ് AI സൊല്യൂഷൻസ്](../../examples/retail-scenario.md)
- **➡️ അടുത്തത്**: [SKU തെരഞ്ഞടുപ്പ്](sku-selection.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 7: പ്രശ്‌നപരിഹാരം](../chapter-07-troubleshooting/common-issues.md)

## പരിചയം

അസ്യൂർ ഡെവലപ്പർ CLI ഉപയോഗിച്ച് വിനിയോഗം നടത്തുന്നതിന് മുൻപ് അസ്യൂർ റിസോഴ്‌സ് ശേഷി പദ്ധതിയിടുകയും സാധൂകരിക്കുകയും ചെയ്യാൻ സഹായിക്കുന്ന സമഗ്രമായ മാർഗ്ഗദർശികയാണ് ഇത്. വിജയകരമായ വിനിയോഗങ്ങൾക്കായി ക്വോട്ടകൾ, ലഭ്യത, പ്രാദേശിക നിയന്ത്രണങ്ങൾ വിലയിരുത്തി ചെലവും പ്രകടനവും മെച്ചപ്പെടുത്തുന്നത് പഠിക്കൂ. വ്യത്യസ്ത ആപ്ലിക്കേഷൻ വാസ്തുവിദ്യകൾക്കും സ്കെയ്ലിംഗ് ഘടനകൾക്കും ശേഷി പദ്ധതിയിടൽ സാങ്കേതികതകൾ കൈകാര്യം ചെയ്യുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ മാർഗ്ഗദർശിക പൂർത്തിയാക്കിയാൽ, നിങ്ങൾക്ക്:
- അസ്യൂർ ക്വോട്ടകൾ, പരിമിതികൾ, പ്രാദേശിക ലഭ്യത നിയന്ത്രണങ്ങൾ മനസ്സിലാക്കാൻ
- വിനിയോഗത്തിന് മുമ്പ് റിസോഴ്‌സ് ലഭ്യതയും ശേഷിയും പരിശോധിക്കുന്ന സാങ്കേതികതകൾ കൈകാര്യം ചെയ്യാൻ
- സ്വയമേവ ശേഷി സാധൂകരിക്കൽ, നിരീക്ഷണ തന്ത്രങ്ങൾ നടപ്പിലാക്കാൻ
- മാർഗ്ഗനിർദ്ദേശത്തോടെ റിസോഴ്‌സ് വലിപ്പം ക്രമീകരിച്ചും സ്കെയ്ലിങ്ങ് പരിഗണിച്ച് ആപ്ലിക്കേഷനുകൾ രൂപകൽപ്പന ചെയ്‌തിരിക്കാൻ
- ബുദ്ധിമുട്ടുള്ള ശേഷി പദ്ധതിയിടൽ വഴി ചെലവ് നിർവചനം നടപ്പിലാക്കാൻ
- ക്വോട്ടൈൻറിംഗ് ഉപയോഗം, റിസോഴ്‌സ് ലഭ്യതക്കായി അലർട്ടുകളും നിരീക്ഷണവും ക്രമീകരിക്കാൻ

## പഠന ഫലങ്ങൾ

പൂർത്തീകരിക്കുമ്പോൾ, നിങ്ങൾക്ക് സാധിക്കുമെന്ന്:
- അസ്യൂർ റിസോഴ്‌സ് ശേഷി ആവശ്യങ്ങൾ വിനിയോഗത്തിന് മുമ്പ് വിലയിരുത്താനും സാധൂകരിക്കാനും
- ശേഷി പരിശോധിക്കൽ, ക്വോട്ട മോണിറ്ററിംഗ് എന്നിവയ്ക്കായി സ്വയം പ്രവർത്തിക്കുന്ന സ്ക്രിപ്റ്റുകൾ ഉണ്ടാക്കാനുമാകും
- പ്രാദേശിക, സബ്സ്ക്രിപ്ഷൻ പരിമിതികൾ പരിഗണിച്ച്കൊണ്ട് സ്കേലബിൾ ആർക്കിടെക്ചറുകൾ രൂപകൽപ്പന ചെയ്യാൻ
- വ്യത്യസ്ത വർക്ക്ലോഡ് തരങ്ങൾക്ക് ചെലവു-ദക്ഷമായ റിസോഴ്‌സ് വലിപ്പ നിശ്ചയ തന്ത്രങ്ങൾ നടപ്പിലാക്കാൻ
- ശേഷിയുമായി ബന്ധപ്പെട്ട പ്രശ്‌നങ്ങൾക്ക് മുൻകൂട്ടി നിരീക്ഷണം, അലർട്ടുകൾ ക്രമീകരിക്കാൻ
- ശരിയായ ശേഷി വിതരണത്തോടുകൂടെ മൾട്ടി-പ്രാദേശിക വിനിയോഗങ്ങൾ പ്ലാൻ ചെയ്യാൻ

## ശേഷി പദ്ധതിയിടൽ എവിടെ പ്രസക്തമാണ്

> **പരിധി:** ഈ ബാഷ് ഉദാഹരണങ്ങൾക്ക് അസ്യൂർ CLI, `jq`, തിരഞ്ഞെടുക്കപ്പെട്ട സബ്സ്ക്രിപ്ഷൻ ആവശ്യമാണ്. പ്രസിദ്ധീകരിച്ച ഓഫറിംഗുകളും ക്വോട്ടയും പരിശോധിക്കുന്നു; ഫിസിക്കൽ ശേഷി തെളിയിക്കുകയോ റിസോഴ്‌സുകൾ സംരക്ഷിക്കുകയോ ചെയ്യില്ല. സ്ക്രിപ്റ്റ്/കോൺഫിഗ് ഫയൽനെയിമുകൾ ഉദാഹരണങ്ങൾ മാത്രമാണ്, നൽകുന്നDeliverables ആകാറില്ല. VM ക്വോട്ടകൾ കണ്ടെയ്‌നർ ആപ്പ്സ്, ആപ്പ് സർവീസ്, അസ്യൂർ ഓപ്പൺഐ ക്വോട്ടകൾ ഉൾക്കൊള്ളുന്നില്ല.

ആപ്ലിക്കേഷനുകൾ വിനിയോഗിക്കുന്നതിന് മുമ്പ് നിങ്ങളെ ഉറപ്പാക്കേണ്ടത്:
- ആവശ്യമായ റിസോഴ്‌സുകൾക്കായി **ക്വോട്ട മതി**
- നിങ്ങളുടെ ലക്ഷ്യം പ്രാദേശികത്തിൽ **റിസോഴ്‌സ് ലഭ്യത**
- സബ്സ്ക്രിപ്ഷൻ ടൈപ്പിനനുസരിച്ച് **സർവീസ് ടിയർ ലഭ്യത**
- പ്രതീക്ഷിക്കുന്ന ട്രാഫിക്കിന് **നെറ്റ്‌വർക്ക് ശേഷി**
- ശരിയായ വലിപ്പം വഴി **ചെലവ് തയ്യൽ**

## 📊 അസ്യൂർ ക്വോട്ടകളും പരിധികളും മനസ്സിലാക്കൽ

### പരിധികളുടെ തരം
1. **സബ്സ്ക്രിപ്ഷൻ തലത്തിലുള്ള ക്വോട്ടകൾ** - സബ്സ്ക്രിപ്ഷൻ ഒന്നിന് പരമാവധി റിസോഴ്‌സുകൾ
2. **പ്രാദേശിക ക്വോട്ടകൾ** - ഓരോ പ്രാദേശത്തിനും പരമാവധി റിസോഴ്‌സുകൾ
3. **റിസോഴ്‌സ്-നിർദിഷ്ട പരിധികൾ** - വ്യക്തിഗത റിസോഴ്‌സ് തരം പരിധികൾ
4. **സർവീസ് ടിയർ പരിധികൾ** - നിങ്ങളുടെ സേവന പദ്ധതിയുടെ അടിസ്ഥാനത്തിൽ പരിധികൾ

### സാധാരണ റിസോഴ്‌സ് ക്വോട്ടകൾ
```bash
# Check current quota usage
az vm list-usage --location eastus2 --output table

# Check specific resource quotas
az network list-usages --location eastus2 --output table
az storage account show-usage --location eastus2 --output table
```

## വിനിയോഗത്തിനു മുന്നോടിയായുള്ള ശേഷി പരിശോധനകൾ

### സ്വയം പ്രവർത്തിക്കുന്ന ശേഷി സാധൂകരിക്കൽ സ്ക്രിപ്റ്റ്
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

### സർവീസ്-നിർദിഷ്ട ശേഷി പരിശോധനകൾ

#### ആപ്പ് സർവീസ് ശേഷി
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

#### ഡേറ്റാബേസ് ശേഷി
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

#### കണ്ടെയ്‌നർ ആപ്പ്സ് ശേഷി
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

## 📍 പ്രാദേശിക ലഭ്യത സാധൂകരിക്കൽ

### പ്രാദേശിക അടിസ്ഥാനമാക്കിയുള്ള സർവീസ് ലഭ്യത
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

### പ്രാദേശിക തിരഞ്ഞെടുപ്പ് ചർച്ച (ഉദാഹരണമായി)

താഴെയുള്ള ലേബലുകൾ പരിശോധനയ്ക്ക് പ്രോംപ്റ്റുകളാണ്, നിലവിലെ പ്രാദേശിക വിലകളും അളന്ന ശേഷിയും താരതമ്യം ചെയ്യുക. ജർമനി പ്രാദേശികം GDPR ആവശ്യപ്പെടുന്നില്ല; താമസം, സേവന സവിശേഷതകൾ, സംഘടന/നിയമമാനദണ്ഡങ്ങൾ കൂടി വിലയിരുത്തണം.
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

## 💰 ചെലവ് പദ്ധതിയിടലും കണക്കുകൂട്ടലും

### റിസോഴ്‌സ് ചെലവ് കണക്കുകൂട്ടൽ
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

### SKU അപ്പ്‌ടിമൈസേഷൻ ശുപാർശകൾ
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

## 🚀 സ്വയം പ്രവർത്തിക്കുന്ന പ്രീ-ഫ്ലൈറ്റ് പരിശോധനകൾ

### സമഗ്രമായ പ്രീ-ഫ്ലൈറ്റ് സ്ക്രിപ്റ്റ്
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

### കോൺഫിഗറേഷൻ ഫയൽ ടമ്പ്ലേറ്റ്
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

## 📈 വിനിയോഗ സമയത്തെ ശേഷി നിരീക്ഷണം

### റിയൽ-ടൈം ശേഷി നിരീക്ഷണം
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

## 🔗 AZD യുമായി ഇന്റഗ്രേഷൻ

### azure.yaml ൽ പ്രീ-ഫ്ലൈറ്റ് ഹുക്കുകൾ ചേർക്കുക
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

## മികച്ച ചാരിതാർത്ഥ്യങ്ങൾ

1. **പുതിയ പ്രാദേശങ്ങളിൽ വിനിയോഗം നടത്തുന്നതിന് മുമ്പ് എപ്പോഴും ശേഷി പരിശോധനകൾ നടത്തുക**
2. **അപ്രതീക്ഷിതങ്ങൾ ഒഴിവാക്കാൻ ക്വോട്ട ഉപയോഗം സ്ഥിരമായി മോണിറ്റർ ചെയ്യുക**
3. **ഭാവിയിലെ ശേഷി ആവശ്യങ്ങൾ പരിശോധിച്ച് വളർച്ചക്ക് തയ്യാറെടുക്കുക**
4. **ബിൽ ഷോക്ക് ഒഴിവാക്കാൻ ചെലവ് കണക്കുകൂട്ടൽ ഉപകരണങ്ങൾ ഉപയോഗിക്കുക**
5. **നിങ്ങളുടെ ടീമിന് ശേഷി ആവശ്യങ്ങൾ രേഖപ്പെടുത്തുക**
6. **CI/CD പൈപ്പ് ലൈൻകളിൽ ശേഷി സാധൂകരിക്കൽ സ്വയം പ്രക്രിയയാക്കുക**
7. **പ്രാദേശിക ഫെയ്ലോവർ ശേഷി ആവശ്യങ്ങൾ പരിഗണിക്കുക**

## തുടർന്ന് എന്തൊക്കെ ചെയ്യാം

- [SKU തിരഞ്ഞെടുപ്പ് ഗൈഡ്](sku-selection.md) - മികച്ച സർവീസ് ടിയറുകൾ തിരഞ്ഞെടുത്ത്
- [പ്രീ-ഫ്ലൈറ്റ് പരിശോധനകൾ](preflight-checks.md) - സ്വയം പ്രവർത്തിക്കുന്ന സാധൂകരിക്കൽ സ്ക്രിപ്റ്റുകൾ
- [ചീറ്റീട് ഷീറ്റ്](../../resources/cheat-sheet.md) - വേഗം കാണാനുള്ള കമാൻഡുകൾ
- [ഗ്ലോസറി](../../resources/glossary.md) - പദങ്ങളെ കുറിച്ചും വ്യാഖ്യാനങ്ങളും

## അധിക സ്രോതസ്സുകൾ

- [അസ്യൂർ സബ്സ്ക്രിപ്ഷൻ പരിധികൾ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [അസ്യൂർ വില കാൽക്കുലേറ്റർ](https://azure.microsoft.com/pricing/calculator/)
- [അസ്യൂർ ചെലവ് മാനേജ്മെന്റ്](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [അസ്യൂർ പ്രാദേശിക ലഭ്യത](https://azure.microsoft.com/global-infrastructure/services/)

---

**നാവിഗേഷൻ**
- **മുമ്പത്തെ പാഠം**: [ഡെബഗ്ഗിംഗ് ഗൈഡ്](../chapter-07-troubleshooting/debugging.md)

- **അടുത്ത പാഠം**: [SKU തെരഞ്ഞടുപ്പ്](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->