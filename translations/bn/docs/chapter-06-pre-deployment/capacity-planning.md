# ক্যাপাসিটি পরিকল্পনা - এজুর রিসোর্স উপলব্ধতা এবং সীমাবদ্ধতা

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনারস](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৬ - প্রি-ডিপ্লয়মেন্ট যাচাই ও পরিকল্পনা
- **⬅️ পূর্ববর্তী অধ্যায়**: [অধ্যায় ৫: মাল্টি-এজেন্ট AI সলিউশনস](../../examples/retail-scenario.md)
- **➡️ পরবর্তী**: [SKU নির্বাচন](sku-selection.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৭: সমস্যা সমাধান](../chapter-07-troubleshooting/common-issues.md)

## পরিচিতি

এই বিস্তৃত গাইডটি আপনাকে Azure Developer CLI ব্যবহার করে ডিপ্লয়মেন্টের আগে এজুর রিসোর্স ক্যাপাসিটি পরিকল্পনা ও যাচাই করতে সাহায্য করে। কোটা, উপলব্ধতা, এবং আঞ্চলিক সীমাবদ্ধতা মূল্যায়ন করে সফল ডিপ্লয়মেন্ট সুনিশ্চিত করুন এবং খরচ ও কর্মক্ষমতা সর্বাধিক করুন। বিভিন্ন অ্যাপ্লিকেশন আর্কিটেকচার এবং স্কেলিং পরিস্থিতির জন্য ক্যাপাসিটি পরিকল্পনা কৌশল শিখুন।

## শেখার লক্ষ্যসমূহ

এই গাইড সম্পন্ন করার মাধ্যমে আপনি:
- এজুর কোটা, সীমা এবং আঞ্চলিক উপলব্ধতা সীমাবদ্ধতা বুঝতে পারবেন
- ডিপ্লয়মেন্ট পূর্বে রিসোর্স উপলব্ধতা এবং ক্যাপাসিটি পরীক্ষা করার কৌশল দক্ষ হবেন
- স্বয়ংক্রিয় ক্যাপাসিটি যাচাই এবং মনিটরিং কৌশল বাস্তবায়ন করতে পারবেন
- সঠিক রিসোর্স সাইজিং ও স্কেলিং বিবেচনা নিয়ে অ্যাপ্লিকেশন ডিজাইন করতে পারবেন
- বুদ্ধিমত্তাসম্পন্ন ক্যাপাসিটি পরিকল্পনার মাধ্যমে খরচ অপ্টিমাইজেশন প্রয়োগ করতে পারবেন
- কোটা ব্যবহারের জন্য সতর্কতা এবং মনিটরিং কনফিগার করতে পারবেন

## শেখার ফলাফল

শেষে, আপনি সক্ষম হবেন:
- ডিপ্লয়মেন্ট পূর্বে এজুর রিসোর্স ক্যাপাসিটি প্রয়োজনীয়তা মূল্যায়ন ও যাচাই করতে
- ক্যাপাসিটি পরীক্ষা ও কোটা মনিটরিংয়ের জন্য স্বয়ংক্রিয় স্ক্রিপ্ট তৈরি করতে
- আঞ্চলিক ও সাবস্ক্রিপশন সীমাবদ্ধতা বিবেচনা করে স্কেলযোগ্য আর্কিটেকচার ডিজাইন করতে
- বিভিন্ন ওয়ার্কলোড টাইপের জন্য খরচ-কার্যকর রিসোর্স সাইজিং কৌশল বাস্তবায়ন করতে
- ক্যাপাসিটি-সম্পর্কিত সমস্যা মোকাবিলায় সক্রিয় মনিটরিং ও সতর্কতা কনফিগার করতে
- সঠিক ক্যাপাসিটি ডিস্ট্রিবিউশনের মাধ্যমে মাল্টি-রিজিওন ডিপ্লয়মেন্ট পরিকল্পনা করতে

## কেন ক্যাপাসিটি পরিকল্পনা গুরুত্বপূর্ণ

> **পরিধি:** এই Bash উদাহরণগুলোর জন্য Azure CLI, `jq`, এবং একটি নির্বাচিত সাবস্ক্রিপশন প্রয়োজন। এগুলো প্রকাশিত অফার এবং কোটা পরীক্ষা করে; শারীরিক ক্যাপাসিটি প্রমাণ করে না বা রিসোর্স সংরক্ষণ করে না। নিজস্ব প্রকল্পে স্নিপেটগুলো সংরক্ষণ/অভিযোজন করুন—নীচের স্ক্রিপ্ট/কনফিগ ফাইলের নাম উদাহরণস্বরূপ, চেক-ইন ডেলিভারেবল নয়। VM কোটা Container Apps, App Service, বা Azure OpenAI কোটা অন্তর্ভুক্ত করে না।

অ্যাপ্লিকেশন ডিপ্লয়মেন্টের আগে নিশ্চিত করতে হবে:
- **প্রয়োজনীয় রিসোর্সের জন্য যথেষ্ট কোটা**
- **লক্ষ্য আঞ্চলিকে রিসোর্স উপলব্ধতা**
- **আপনার সাবস্ক্রিপশন টাইপের জন্য সার্ভিস টিয়ার উপলব্ধতা**
- **প্রত্যাশিত ট্রাফিকের জন্য নেটওয়ার্ক ক্যাপাসিটি**
- **সঠিক সাইজিংয়ের মাধ্যমে খরচ অপ্টিমাইজেশন**

## 📊 এজুর কোটা এবং সীমাবদ্ধতাগুলি বোঝা

### সীমার প্রকারভেদ
১. **সাবস্ক্রিপশন-স্তরের কোটা** - প্রতিটি সাবস্ক্রিপশনের সর্বোচ্চ রিসোর্স
২. **আঞ্চলিক কোটা** - প্রতি অঞ্চলের সর্বোচ্চ রিসোর্স
৩. **রিসোর্স-নির্দিষ্ট সীমা** - নির্দিষ্ট রিসোর্স প্রকারের জন্য সীমাবদ্ধতা
৪. **সার্ভিস টিয়ার সীমা** - আপনার সার্ভিস প্ল্যান ভিত্তিক সীমা

### সাধারণ রিসোর্স কোটা
```bash
# Check current quota usage
az vm list-usage --location eastus2 --output table

# Check specific resource quotas
az network list-usages --location eastus2 --output table
az storage account show-usage --location eastus2 --output table
```

## প্রি-ডিপ্লয়মেন্ট ক্যাপাসিটি চেকসমূহ

### স্বয়ংক্রিয় ক্যাপাসিটি যাচাই স্ক্রিপ্ট
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

### সার্ভিস-নির্দিষ্ট ক্যাপাসিটি চেকস

#### অ্যাপ সার্ভিস ক্যাপাসিটি
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

#### ডাটাবেস ক্যাপাসিটি
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

#### কন্টেইনার অ্যাপস ক্যাপাসিটি
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

## 📍 আঞ্চলিক উপলব্ধতা যাচাই

### আঞ্চলিক ভিত্তিতে সার্ভিস উপলব্ধতা
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

### অঞ্চল নির্বাচন আলোচনা (চিত্রত্মক)

নিম্নলিখিত লেবেলগুলি তদন্তের জন্য প্রম্পট; যাচাইকৃত মূল্য, হার্ডওয়্যার, বা সম্মতি র‌্যাঙ্কিং নয়। বর্তমান আঞ্চলিক মূল্য এবং পরিমাপিত ল্যাটেন্সির তুলনা করুন। GDPR সরাসরি একটি জার্মানি অঞ্চল দাবি করে না; বাসস্থান, সার্ভিস বৈশিষ্ট্য, এবং সাংগঠনিক/আইনি প্রয়োজন একসাথে মূল্যায়ন করতে হবে।
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

## 💰 খরচ পরিকল্পনা এবং অনুমান

### রিসোর্স খরচ অনুমান
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

### SKU অপ্টিমাইজেশন সুপারিশ
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

## 🚀 স্বয়ংক্রিয় প্রি-ফ্লাইট চেকস

### ব্যাপক প্রি-ফ্লাইট স্ক্রিপ্ট
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

### কনফিগারেশন ফাইল টেমপ্লেট
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

## 📈 ডিপ্লয়মেন্টের সময় ক্যাপাসিটি মনিটরিং

### রিয়েল-টাইম ক্যাপাসিটি মনিটরিং
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

## 🔗 AZD এর সাথে ইন্টিগ্রেশন

### azure.yaml এ প্রি-ফ্লাইট হুক যোগ করা
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

## সেরা অনুশীলনসমূহ

১. **নতুন অঞ্চলে ডিপ্লয়মেন্টের আগে সর্বদা ক্যাপাসিটি চেকস চালান**
২. **অপ্রত্যাশিত পরিস্থিতি এড়াতে নিয়মিত কোটা ব্যবহারের নজরদারি করুন**
৩. **ভবিষ্যতের ক্যাপাসিটি প্রয়োজন বিবেচনা করে বৃদ্ধি পরিকল্পনা করুন**
৪. **বিল শক এড়াতে খরচ অনুমান সরঞ্জাম ব্যবহার করুন**
৫. **আপনার দলের জন্য ক্যাপাসিটি প্রয়োজনীয়তার নথি তৈরি করুন**
৬. **CI/CD পাইপলাইনে ক্যাপাসিটি যাচাই স্বয়ংক্রিয়করণ করুন**
৭. **আঞ্চলিক ফেইলওভার ক্যাপাসিটি প্রয়োজনীয়তা বিবেচনা করুন**

## পরবর্তী ধাপ

- [SKU নির্বাচন গাইড](sku-selection.md) - সর্বোত্তম সার্ভিস টিয়ার নির্বাচন করুন
- [প্রি-ফ্লাইট চেকস](preflight-checks.md) - স্বয়ংক্রিয় যাচাই স্ক্রিপ্ট
- [চিট শিট](../../resources/cheat-sheet.md) - দ্রুত রেফারেন্স কমান্ড
- [শব্দকোষ](../../resources/glossary.md) - পরিভাষা ও সংজ্ঞা

## অতিরিক্ত সম্পদ

- [Azure সাবস্ক্রিপশন সীমা](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure মূল্য নির্ধারণ ক্যালকুলেটর](https://azure.microsoft.com/pricing/calculator/)
- [Azure খরচ ব্যবস্থাপনা](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure আঞ্চলিক উপলব্ধতা](https://azure.microsoft.com/global-infrastructure/services/)

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [ডিবাগিং গাইড](../chapter-07-troubleshooting/debugging.md)

- **পরবর্তী পাঠ**: [SKU নির্বাচন](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->