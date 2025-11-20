<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "133c6f0d02c698cbe1cdb5d405ad4994",
  "translation_date": "2025-11-20T11:59:30+00:00",
  "source_file": "docs/pre-deployment/capacity-planning.md",
  "language_code": "bn"
}
-->
# সক্ষমতা পরিকল্পনা - Azure রিসোর্সের প্রাপ্যতা এবং সীমা

**অধ্যায়ের নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনারস](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৬ - প্রি-ডিপ্লয়মেন্ট যাচাই ও পরিকল্পনা
- **⬅️ পূর্ববর্তী অধ্যায়**: [অধ্যায় ৫: মাল্টি-এজেন্ট AI সমাধান](../../examples/retail-scenario.md)
- **➡️ পরবর্তী**: [SKU নির্বাচন](sku-selection.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৭: সমস্যা সমাধান](../troubleshooting/common-issues.md)

## ভূমিকা

এই বিস্তৃত গাইডটি আপনাকে Azure Developer CLI ব্যবহার করে ডিপ্লয় করার আগে Azure রিসোর্সের সক্ষমতা পরিকল্পনা এবং যাচাই করতে সাহায্য করবে। কোটা, প্রাপ্যতা এবং আঞ্চলিক সীমাবদ্ধতা মূল্যায়ন করতে শিখুন যাতে সফল ডিপ্লয়মেন্ট নিশ্চিত করা যায় এবং খরচ ও পারফরম্যান্স অপ্টিমাইজ করা যায়। বিভিন্ন অ্যাপ্লিকেশন আর্কিটেকচার এবং স্কেলিং পরিস্থিতির জন্য সক্ষমতা পরিকল্পনার কৌশল আয়ত্ত করুন।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করার মাধ্যমে আপনি:
- Azure কোটা, সীমা এবং আঞ্চলিক প্রাপ্যতার সীমাবদ্ধতা বুঝতে পারবেন
- ডিপ্লয়মেন্টের আগে রিসোর্স প্রাপ্যতা এবং সক্ষমতা যাচাই করার কৌশল আয়ত্ত করবেন
- স্বয়ংক্রিয় সক্ষমতা যাচাই এবং মনিটরিং কৌশল বাস্তবায়ন করবেন
- সঠিক রিসোর্স সাইজিং এবং স্কেলিং বিবেচনা করে অ্যাপ্লিকেশন ডিজাইন করবেন
- বুদ্ধিমত্তাপূর্ণ সক্ষমতা পরিকল্পনার মাধ্যমে খরচ অপ্টিমাইজেশন কৌশল প্রয়োগ করবেন
- কোটা ব্যবহারের জন্য সতর্কতা এবং মনিটরিং কনফিগার করবেন

## শেখার ফলাফল

এই গাইড সম্পন্ন করার পর আপনি:
- ডিপ্লয়মেন্টের আগে Azure রিসোর্সের সক্ষমতা প্রয়োজনীয়তা মূল্যায়ন এবং যাচাই করতে পারবেন
- সক্ষমতা যাচাই এবং কোটা মনিটরিংয়ের জন্য স্বয়ংক্রিয় স্ক্রিপ্ট তৈরি করতে পারবেন
- আঞ্চলিক এবং সাবস্ক্রিপশন সীমা বিবেচনা করে স্কেলযোগ্য আর্কিটেকচার ডিজাইন করতে পারবেন
- বিভিন্ন ওয়ার্কলোডের জন্য খরচ-সাশ্রয়ী রিসোর্স সাইজিং কৌশল বাস্তবায়ন করতে পারবেন
- সক্ষমতা-সম্পর্কিত সমস্যার জন্য সক্রিয় মনিটরিং এবং সতর্কতা কনফিগার করতে পারবেন
- সঠিক সক্ষমতা বিতরণ সহ মাল্টি-রিজিওন ডিপ্লয়মেন্ট পরিকল্পনা করতে পারবেন

## কেন সক্ষমতা পরিকল্পনা গুরুত্বপূর্ণ

অ্যাপ্লিকেশন ডিপ্লয় করার আগে নিশ্চিত করতে হবে:
- **যথেষ্ট কোটা** প্রয়োজনীয় রিসোর্সের জন্য
- **রিসোর্স প্রাপ্যতা** আপনার টার্গেট রিজিওনে
- **সার্ভিস টিয়ার প্রাপ্যতা** আপনার সাবস্ক্রিপশন টাইপের জন্য
- **নেটওয়ার্ক সক্ষমতা** প্রত্যাশিত ট্রাফিকের জন্য
- **খরচ অপ্টিমাইজেশন** সঠিক সাইজিংয়ের মাধ্যমে

## 📊 Azure কোটা এবং সীমা বোঝা

### সীমার ধরন
1. **সাবস্ক্রিপশন-লেভেল কোটা** - প্রতি সাবস্ক্রিপশনে সর্বোচ্চ রিসোর্স
2. **আঞ্চলিক কোটা** - প্রতি রিজিওনে সর্বোচ্চ রিসোর্স
3. **রিসোর্স-নির্দিষ্ট সীমা** - নির্দিষ্ট রিসোর্স টাইপের জন্য সীমা
4. **সার্ভিস টিয়ার সীমা** - আপনার সার্ভিস প্ল্যান অনুযায়ী সীমা

### সাধারণ রিসোর্স কোটা
```bash
# বর্তমান কোটার ব্যবহার পরীক্ষা করুন
az vm list-usage --location eastus2 --output table

# নির্দিষ্ট রিসোর্স কোটাগুলি পরীক্ষা করুন
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## প্রি-ডিপ্লয়মেন্ট সক্ষমতা যাচাই

### স্বয়ংক্রিয় সক্ষমতা যাচাই স্ক্রিপ্ট
```bash
#!/bin/bash
# capacity-check.sh - ডিপ্লয়মেন্টের আগে Azure ক্ষমতা যাচাই করুন

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# কোটার ব্যবহার পরীক্ষা করার ফাংশন
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

# বিভিন্ন রিসোর্স কোটাগুলি পরীক্ষা করুন
check_quota "compute" 4      # ৪টি vCPU প্রয়োজন
check_quota "storage" 2      # ২টি স্টোরেজ অ্যাকাউন্ট প্রয়োজন
check_quota "network" 1      # ১টি ভার্চুয়াল নেটওয়ার্ক প্রয়োজন

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### সার্ভিস-নির্দিষ্ট সক্ষমতা যাচাই

#### অ্যাপ সার্ভিস সক্ষমতা
```bash
# অ্যাপ সার্ভিস প্ল্যানের প্রাপ্যতা পরীক্ষা করুন
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # অঞ্চলে উপলব্ধ SKU পরীক্ষা করুন
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # বিকল্প অঞ্চল প্রস্তাব করুন
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # বর্তমান ব্যবহার পরীক্ষা করুন
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# ব্যবহার
check_app_service_capacity "eastus2" "P1v3"
```

#### ডাটাবেস সক্ষমতা
```bash
# PostgreSQL ক্ষমতা পরীক্ষা করুন
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # SKU উপলব্ধ কিনা পরীক্ষা করুন
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # উপলব্ধ SKU দেখান
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB ক্ষমতা পরীক্ষা করুন
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # অঞ্চল উপলব্ধতা পরীক্ষা করুন
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # সার্ভারলেস সমর্থিত কিনা পরীক্ষা করুন (যদি প্রয়োজন হয়)
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

#### কন্টেইনার অ্যাপস সক্ষমতা
```bash
# কন্টেইনার অ্যাপসের ক্ষমতা পরীক্ষা করুন
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # পরীক্ষা করুন কন্টেইনার অ্যাপস অঞ্চলটিতে উপলব্ধ কিনা
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # বর্তমান পরিবেশের সংখ্যা পরীক্ষা করুন
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # কন্টেইনার অ্যাপসের প্রতি অঞ্চলে ১৫টি পরিবেশের সীমা রয়েছে
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # উপলব্ধ অঞ্চলগুলি দেখান
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 আঞ্চলিক প্রাপ্যতা যাচাই

### রিজিওন অনুযায়ী সার্ভিস প্রাপ্যতা
```bash
# অঞ্চল জুড়ে পরিষেবার প্রাপ্যতা পরীক্ষা করুন
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

# সমস্ত পরিষেবা পরীক্ষা করুন
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### রিজিওন নির্বাচন সুপারিশ
```bash
# প্রয়োজনীয়তার উপর ভিত্তি করে সর্বোত্তম অঞ্চলগুলি সুপারিশ করুন
recommend_region() {
    local requirements=$1  # "কম খরচ" | "কর্মক্ষমতা" | "অনুবর্তিতা"
    
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

## 💰 খরচ পরিকল্পনা এবং অনুমান

### রিসোর্স খরচ অনুমান
```bash
# স্থাপনার খরচ অনুমান করুন
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # অনুমানের জন্য একটি অস্থায়ী রিসোর্স গ্রুপ তৈরি করুন
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # যাচাইকরণ মোডে অবকাঠামো স্থাপন করুন
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # অস্থায়ী রিসোর্স গ্রুপ পরিষ্কার করুন
    az group delete --name "$temp_rg" --yes --no-wait
    
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
# প্রয়োজনীয়তার উপর ভিত্তি করে সর্বোত্তম SKU সুপারিশ করুন
recommend_sku() {
    local service=$1
    local workload_type=$2  # "ডেভ" | "স্টেজিং" | "প্রোডাকশন"
    
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

## 🚀 স্বয়ংক্রিয় প্রি-ফ্লাইট যাচাই

### বিস্তৃত প্রি-ফ্লাইট স্ক্রিপ্ট
```bash
#!/bin/bash
# preflight-check.sh - সম্পূর্ণ প্রাক-প্রকাশ যাচাইকরণ

set -e

# কনফিগারেশন
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# আউটপুটের জন্য রঙ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # কোন রঙ নেই

# লগিং ফাংশন
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# কনফিগারেশন লোড করুন
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

# পরীক্ষা ১: প্রমাণীকরণ
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# পরীক্ষা ২: আঞ্চলিক প্রাপ্যতা
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# পরীক্ষা ৩: কোটার যাচাইকরণ
log_info "Checking quota availability..."

# vCPU কোটার
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

# স্টোরেজ অ্যাকাউন্ট কোটার
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

# পরীক্ষা ৪: পরিষেবার প্রাপ্যতা
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

# পরীক্ষা ৫: নেটওয়ার্ক ক্ষমতা
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

# পরীক্ষা ৬: রিসোর্স নামকরণের যাচাইকরণ
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# পরীক্ষা ৭: খরচের অনুমান
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

# পরীক্ষা ৮: টেমপ্লেট যাচাইকরণ
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

# চূড়ান্ত সারাংশ
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
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

## 📈 ডিপ্লয়মেন্ট চলাকালীন সক্ষমতা মনিটরিং

### রিয়েল-টাইম সক্ষমতা মনিটরিং
```bash
# স্থাপনার সময় ক্ষমতা পর্যবেক্ষণ করুন
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # স্থাপনার স্থিতি পরীক্ষা করুন
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
        
        # বর্তমান সম্পদের ব্যবহার পরীক্ষা করুন
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD এর সাথে ইন্টিগ্রেশন

### azure.yaml-এ প্রি-ফ্লাইট হুক যোগ করুন
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

## সেরা অনুশীলন

1. **ডিপ্লয় করার আগে সক্ষমতা যাচাই করুন** নতুন রিজিওনে
2. **নিয়মিত কোটা ব্যবহারের মনিটরিং করুন** যাতে অপ্রত্যাশিত সমস্যা এড়ানো যায়
3. **ভবিষ্যতের সক্ষমতা প্রয়োজনীয়তা পরিকল্পনা করুন**
4. **খরচ অনুমান টুল ব্যবহার করুন** বিল শকের থেকে বাঁচতে
5. **আপনার টিমের জন্য সক্ষমতা প্রয়োজনীয়তা ডকুমেন্ট করুন**
6. **CI/CD পাইপলাইনে সক্ষমতা যাচাই স্বয়ংক্রিয় করুন**
7. **আঞ্চলিক ফেইলওভার সক্ষমতা প্রয়োজনীয়তা বিবেচনা করুন**

## পরবর্তী পদক্ষেপ

- [SKU নির্বাচন গাইড](sku-selection.md) - সেরা সার্ভিস টিয়ার নির্বাচন করুন
- [প্রি-ফ্লাইট যাচাই](preflight-checks.md) - স্বয়ংক্রিয় যাচাই স্ক্রিপ্ট
- [চিট শিট](../../resources/cheat-sheet.md) - দ্রুত রেফারেন্স কমান্ড
- [গ্লসারি](../../resources/glossary.md) - শব্দ এবং সংজ্ঞা

## অতিরিক্ত রিসোর্স

- [Azure সাবস্ক্রিপশন সীমা](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure প্রাইসিং ক্যালকুলেটর](https://azure.microsoft.com/pricing/calculator/)
- [Azure খরচ ব্যবস্থাপনা](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure আঞ্চলিক প্রাপ্যতা](https://azure.microsoft.com/global-infrastructure/services/)

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [ডিবাগিং গাইড](../troubleshooting/debugging.md)

- **পরবর্তী পাঠ**: [SKU নির্বাচন](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->