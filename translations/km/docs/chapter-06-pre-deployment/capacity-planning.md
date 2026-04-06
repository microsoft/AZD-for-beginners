# ការធ្វើផែនការ​សមត្ថភាព - ការចូលប្រើ និងដែនកំណត់ធនធាន Azure

**ចរណ៍រុក្ខជាតិ​វគ្គសិក្សាៈ**
- **📚 ទំព័រដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 វគ្គសិក្សាបច្ចុប្បន្ន**: វគ្គ 6 - ការផ្ទៀងផ្ទាត់ និងផែនការ មុនបញ្ច.deploy
- **⬅️ វគ្គមុន**: [វគ្គ 5: ដំណោះស្រាយ Multi-Agent AI](../../examples/retail-scenario.md)
- **➡️ បន្ទាប់**: [ការជ្រើសរើស SKU](sku-selection.md)
- **🚀 វគ្គបន្ទាប់**: [វគ្គ 7: ការដោះសោបញ្ហា](../chapter-07-troubleshooting/common-issues.md)

## ណែនាំ

មគ្គុទ្ទេសក៍ពេញមួយនេះ ជួយអ្នករៀបចំ និងផ្ទៀងផ្ទាត់សមត្ថភាពធនធាន Azure មុននឹងបញ្ច.deploy ជាមួយ Azure Developer CLI។ សូមរៀនពីការវាយតម្លៃគោលបំណង, ការចូលប្រើ និងដែនកំណត់តំបន់ ដើម្បីធានាថាការបញ្ច.deploy របស់អ្នកបានជោគជ័យ ខណៈដែលបង្កើនប្រសិទ្ធភាព និងកាត់បន្ថយចំណាយ។ ជំនាញផែនការសមត្ថភាពចំពោះស្ថាបត្យកម្មកម្មវិធីផ្សេងៗ និងស្ទង់មតិសម្រាប់ការរៀបចំនឹងស្កេល។

## គោលបំណងរៀន

បន្ទាប់ពីបញ្ចប់មគ្គុទ្ទេសក៍នេះ អ្នកនឹងអាចៈ
- អភិវឌ្ឍចំណេះដឹងអំពីគោលកំណត់, ដែនកំណត់ និងការចូលប្រើតំបន់ Azure
- ទទួលបានជំនាញសម្រាប់ពិនិត្យសមត្ថភាព និងការចូលប្រើធនធាន មុនការបញ្ច.deploy
- អនុវត្តវិធីសាស្រ្តផ្ទៀងផ្ទាត់សមត្ថភាព និងត្រួតពិនិត្យដោយស្វ័យប្រវត្តិ
- កែល្បើងកម្មវិធីដោយមានការគិតគូរអំពីទំហំធនធាន និងការស្កេលត្រឹមត្រូវ
- អនុវត្តយុទ្ធសាស្រ្តកាត់បន្ថយចំណាយតាមការធ្វើផែនការសមត្ថភាពយល់ដឹង
- កំណត់សេចក្តីជូនដំណឹង និងត្រួតពិនិត្យអំពីការប្រើប្រាស់គោលកំណត់ និងការចូលប្រើធនធាន

## លទ្ធផលសិក្សា

បន្ទាប់ពីបញ្ចប់ អ្នកអាចៈ
- វាយតម្លៃ និងផ្ទៀងផ្ទាត់តម្រូវការសមត្ថភាពធនធាន Azure មុនការបញ្ច.deploy
- បង្កើតស្គ្រីបដោយស្វ័យប្រវត្តិសម្រាប់ពិនិត្យសមត្ថភាព និងត្រួតពិនិត្យគោលកំណត់
- រចនាស្ថាបត្យកម្មដែលអាចស្កេលបានដោយគិតគូរអំពីដែនកំណត់តំបន់ និងការជាវ
- អនុវត្តយុទ្ធសាស្រ្តកំណត់ទំហំធនធានដែលមានប្រសិទ្ធភាពសម្រាប់ប្រភេទការងារផ្សេងៗ
- កំណត់ការត្រួតពិនិត្យ និងជូនដំណឹងជាការប្រមូលផ្តុំជាមុនសម្រាប់បញ្ហាសមត្ថភាព
- គំរោងបញ្ច.deploy ជាច្រើនតំបន់ដោយចែកចាយសមត្ថភាពត្រឹមត្រូវ

## ហេតុអ្វីបានជា ការធ្វើផែនការសមត្ថភាពសំខាន់

មុនបញ្ច.deploy កម្មវិធី អ្នកត្រូវតែធានាៈ
- **គោលកំណត់គ្រប់គ្រាន់** សម្រាប់ធនធានដែលត្រូវការ
- **ការចូលប្រើធនធាន** នៅតំបន់ដែលអ្នកត្រូវការបញ្ច.deploy
- **ការចូលប្រើសេវាកម្ម Tier** សម្រាប់ប្រភេទការជាវរបស់អ្នក
- **សមត្ថភាពបណ្ដាញ** សម្រាប់ចរាចរណ៍ដែលរំពឹងទុក
- **ការកាត់បន្ថយចំណាយ** តាមរយៈការកំណត់ទំហំ​ត្រឹមត្រូវ

## 📊 ការយល់ដឹងអំពីគោលកំណត់ និងដែនកំណត់ Azure

### ប្រភេទដែនកំណត់
1. **គោលកំណត់កម្រិតការជាវ** - ប្រភេទធនធានអតិបរមាក្នុងការជាវមួយ
2. **គោលកំណត់តំបន់** - សមត្ថភាពធនធានអតិបរមាក្នុងតំបន់មួយ
3. **ដែនកំណត់ធនធានជាក់លាក់** - ដែនកំណត់សម្រាប់ប្រភេទធនធាននិងធនធានបុគ្គល
4. **ដែនកំណត់សេវាកម្ម Tier** - ដែនកំណត់ដោយផ្អែកលើផែនការសេវាកម្មរបស់អ្នក

### គោលកំណត់ធនធានទូទៅ
```bash
# ពិនិត្យការប្រើប្រាស់គណនីបច្ចុប្បន្ន
az vm list-usage --location eastus2 --output table

# ពិនិត្យគណនីធនធានជាក់លាក់
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## ការត្រួតពិនិត្យសមត្ថភាព មុនការបញ្ច.deploy

### ស្គ្រីបផ្ទៀងផ្ទាត់សមត្ថភាពដោយស្វ័យប្រវត្តិ
```bash
#!/bin/bash
# capacity-check.sh - ផ្ទៀងផ្ទាត់សមត្ថភាព Azure មុនការដាក់ឲ្យដំណើរការ

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# មុខងារដើម្បីពិនិត្យការប្រើប្រាស់កំណត់
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

# ពិនិត្យកំណត់ធនធានផ្សេងៗ
check_quota "compute" 4      # ទាមទារ vCPU 4 ខ្ទង់
check_quota "storage" 2      # ទាមទារ​គណនីផ្ទុកទិន្នន័យ 2 គណនី
check_quota "network" 1      # ទាមទារ​បណ្ដាញវេរុស្ទួរ 1

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### ការត្រួតពិនិត្យសមត្ថភាពសម្រាប់សេវាកម្មជាក់លាក់

#### សមត្ថភាព App Service
```bash
# ពិនិត្យល្បឿនផែនការបង្ហោះកម្មវិធី
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # ពិនិត្យ SKU ថ្មីនៅតំបន់
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # ផ្តល់សំណើតំបន់ជំនួស
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # ពិនិត្យការប្រើប្រាស់បច្ចុប្បន្ន
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# ការប្រើប្រាស់
check_app_service_capacity "eastus2" "P1v3"
```

#### សមត្ថភាព Database
```bash
# ធ្វើតេស្តសមត្ថភាព PostgreSQL
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # ពិនិត្យមើលថា SKU មានស្រាប់ឬទេ
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # បង្ហាញ SKU ដែលអាចប្រើបាន
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# ធ្វើតេស្តសមត្ថភាព Cosmos DB
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # ពិនិត្យមើលការចូលអាចប្រើបានតំបន់
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # ពិនិត្យមើលថា serverless បានគាំទ្រឬទេ (ប្រសិនបើចាំបាច់)
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

#### សមត្ថភាព Container Apps
```bash
# ពិនិត្យមើលសមត្ថភាពកម្មវិធីកុងតឺន័រ
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # ពិនិត្យមើលថាកម្មវិធីកុងតឺន័រមានក្នុងតំបន់ឬទេ
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # ពិនិត្យមើលចំនួនបរិយាកាសបច្ចុប្បន្ន
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # កម្មវិធីកុងតឺន័រមានដែនកំណត់ 15 បរិយាកាសក្នុងមួយតំបន់
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # បង្ហាញតំបន់ដែលអាចប្រើបាន
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 ការផ្ទៀងផ្ទាត់ការចូលប្រើតំបន់

### ការចូលប្រើសេវាកម្មតាមតំបន់
```bash
# ពិនិត្យមើលភាពអាចប្រើបានសេវាកម្មនៅតំបន់នានា
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

# ពិនិត្យមើលសេវាកម្មទាំងអស់
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### នឹងផ្តល់អនុសាសន៍ការជ្រើសរើសតំបន់
```bash
# ណែនាំតំបន់ដែលល្អបំផុតអាស្រ័យលើតម្រូវការ
recommend_region() {
    local requirements=$1  # "ថោកតម្លៃ" | "ប្រសិទ្ធភាព" | "ការអនុវត្តតាម"
    
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

## 💰 ការធ្វើផែនការចំណាយ និងការប៉ាន់ស្មាន

### ការប៉ាន់ស្មានតម្លៃធនធាន
```bash
# សូមប៉ាន់ប្រមាណថ្លៃដំណើរការ​ចាក់ផ្សាយ
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # បង្កើតក្រុមធនធាន​បណ្តោះអាសន្នសម្រាប់ការប៉ាន់ប្រមាណ
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # ចាក់ផ្សាយ​ឧសភារគ្រប់គ្រង​នៅក្នុងរបៀបផ្ទៀងផ្ទាត់
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # លុបក្រុមធនធាន​បណ្តោះអាសន្នចេញ
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### នឹងផ្តល់អនុសាសន៍ស្តីពីការប្រសើរឡើង SKU
```bash
# ផ្ដល់អនុសាសន៍ SKU ល្អបំផុតផ្អែកលើតម្រូវការ
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

## 🚀 ការត្រួតពិនិត្យមុនការហោះហើរដោយស្វ័យប្រវត្តិ

### ស្គ្រីបមុនហោះហើរផ្ទាល់មួយ
```bash
#!/bin/bash
# preflight-check.sh - ការផ្ទៀងផ្ទាត់មុនការដាក់ឲ្យប្រើពេញលេញ

set -e

# ការកំណត់រចនាសម្ព័ន្ធ
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# ពណ៌សម្រាប់លទ្ធផលចេញ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # គ្មានពណ៌

# មុខងារចុះបញ្ជីកំណត់ត្រា
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# ផ្ទុកការកំណត់រចនាសម្ព័ន្ធ
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

# ពិនិត្យ 1: ការផ្ទៀងផ្ទាត់រូបសញ្ជាតិ
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# ពិនិត្យ 2: ការចូលប្រើតំបន់តំបន់
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# ពិនិត្យ 3: ការផ្ទៀងផ្ទាត់គណនី
log_info "Checking quota availability..."

# បរិមាណ vCPU
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

# បរិមាណគណនីផ្ទុកទិន្នន័យ
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

# ពិនិត្យ 4: ការចូលប្រើសេវាកម្ម
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

# ពិនិត្យ 5: សមត្ថភាពបណ្តាញ
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

# ពិនិត្យ 6: ការផ្ទៀងផ្ទាត់ឈ្មោះធនធាន
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; បើសិនជា
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# ពិនិត្យ 7: ការប៉ាន់ប្រមាណថ្លៃ
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

# ពិនិត្យ 8: ការផ្ទៀងផ្ទាត់ទម្រង់ផ្សេងៗ
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

# សង្ខេបចុងក្រោយ
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### គំរូឯកសារ ការកំណត់រចនា
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

## 📈 ត្រួតពិនិត្យសមត្ថភាព ក្នុងពេលបញ្ច.deploy

### ការត្រួតពិនិត្យសមត្ថភាពភ្លាម
```bash
# ត្រួតពិនិត្យសមត្ថភាពក្នុងអំឡុងពេលដាក់ឱ្យដំណើរការ
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # ពិនិត្យស្ថានភាពដាក់ឱ្យដំណើរការ
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
        
        # ពិនិត្យការប្រើប្រាស់ធនធានបច្ចុប្បន្ន
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 អន្តរកម្មជាមួយ AZD

### បន្ថែម Hooks មុនហោះហើរ ទៅ azure.yaml
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

## អនុវត្តន៍ល្អៗ

1. **រត់ត្រួតពិនិត្យសមត្ថភាពជាប្រចាំ** មុនបញ្ច.deploy ទៅតំបន់ថ្មីៗ
2. **ត្រួតពិនិត្យការប្រើប្រាស់គោលកំណត់ជារឿយៗ** ដើម្បីជៀសវាងការភ្ញាក់ផ្អើល
3. **គំរោងសម្រាប់ការលូតលាស់** ដោយពិនិត្យតម្រូវការសមត្ថភាពរួចមក
4. **ប្រើឧបករណ៍ប៉ាន់ស្មានចំណាយ** ដើម្បីជៀសវាងវិញ្ញាបនប័ត្រចំណាយ
5. **ឯកសារតម្រូវការសមត្ថភាព** សម្រាប់ក្រុមរបស់អ្នក
6. **ធ្វើផ្ទៀងផ្ទាត់សមត្ថភាពដោយស្វ័យប្រវត្តិ** ក្នុងលំហរកម្មវិធី CI/CD
7. **គិតគូរអំពីតម្រូវការសមត្ថភាពបរាជ័យតំបន់**

## ជំហានបន្ទាប់

- [មគ្គុទ្ទេសក៍ជ្រើសរើស SKU](sku-selection.md) - ជ្រើសរើសសេវាកម្ម Tier អតិបរមា
- [ការត្រួតពិនិត្យមុនហោះហើរ](preflight-checks.md) - ស្គ្រីបផ្ទៀងផ្ទាត់ដោយស្វ័យប្រវត្តិ
- [តារាងជំនួយ](../../resources/cheat-sheet.md) - ពាក្យបញ្ជាឆាប់រហ័ស
- [ពាក្យកំណត់](../../resources/glossary.md) - ពាក្យនិងការពិពណ៌នា

## សម្ភារៈបន្ថែម

- [ដែនកំណត់ការជាវ Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [កាល់គុលទ័រចំណាយ Azure](https://azure.microsoft.com/pricing/calculator/)
- [ការគ្រប់គ្រងចំណាយ Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [ការចូលប្រើតំបន់ Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**ចរណ៍រុក្ខជាតិ**
- **មេរៀនមុន**: [មគ្គុទ្ទេសក៍ចែកច្រាសកំហុស](../chapter-07-troubleshooting/debugging.md)

- **មេរៀនបន្ទាប់**: [ការជ្រើសរើស SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**៖  
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែAI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះបីយើងខិតខំព្យាយាមឱ្យបានត្រឹមត្រូវក៏ដោយ សូមយល់ព្រមថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬមិនត្រឹមត្រូវ។ ឯកសារដើមនៅជាភាសាម្ចាស់របស់វា គួរត្រូវបានកាត់តថាទិន្នន័យផ្លូវការលេខ។ សម្រាប់ព័ត៌មានដែលមានសារៈសំខាន់ ការបកប្រែដោយមនុស្សជំនាញត្រូវបានណែនាំ។ ខាងយើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំណា ឬការបកប្រែខុសណាមួយចេញពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->