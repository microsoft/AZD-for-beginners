<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5d681f3e20256d547ab3eebc052c1b6d",
  "translation_date": "2025-10-13T15:28:56+00:00",
  "source_file": "docs/pre-deployment/capacity-planning.md",
  "language_code": "pa"
}
-->
# ਸਮਰੱਥਾ ਯੋਜਨਾ: Azure ਕੋਟੇ ਅਤੇ ਸੀਮਾਵਾਂ ਦੀ ਸਮਝ

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ Azure Developer CLI ਨਾਲ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ Azure ਸਰੋਤ ਸਮਰੱਥਾ ਦੀ ਯੋਜਨਾ ਬਣਾਉਣ ਅਤੇ ਪ੍ਰਮਾਣਿਤ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ। ਕੋਟੇ, ਉਪਲਬਧਤਾ, ਅਤੇ ਖੇਤਰੀ ਸੀਮਾਵਾਂ ਦਾ ਮੁਲਾਂਕਨ ਕਰਨਾ ਸਿੱਖੋ ਤਾਂ ਜੋ ਸਫਲ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਯਕੀਨੀ ਬਣਾਇਆ ਜਾ ਸਕੇ ਅਤੇ ਖਰਚੇ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਅਨੁਕੂਲ ਕੀਤਾ ਜਾ ਸਕੇ। ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਅਤੇ ਸਕੇਲਿੰਗ ਸਥਿਤੀਆਂ ਲਈ ਸਮਰੱਥਾ ਯੋਜਨਾ ਤਕਨੀਕਾਂ ਵਿੱਚ ਮਾਹਰ ਬਣੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਦੁਆਰਾ, ਤੁਸੀਂ:
- Azure ਕੋਟੇ, ਸੀਮਾਵਾਂ, ਅਤੇ ਖੇਤਰੀ ਉਪਲਬਧਤਾ ਦੀਆਂ ਪਾਬੰਦੀਆਂ ਨੂੰ ਸਮਝੋਗੇ
- ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਸਰੋਤ ਉਪਲਬਧਤਾ ਅਤੇ ਸਮਰੱਥਾ ਦੀ ਜਾਂਚ ਕਰਨ ਦੀਆਂ ਤਕਨੀਕਾਂ ਵਿੱਚ ਮਾਹਰ ਹੋਵੋਗੇ
- ਆਟੋਮੈਟਿਕ ਸਮਰੱਥਾ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਨਿਗਰਾਨੀ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ
- ਸਹੀ ਸਰੋਤ ਆਕਾਰ ਅਤੇ ਸਕੇਲਿੰਗ ਵਿਚਾਰਾਂ ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਡਿਜ਼ਾਈਨ ਕਰੋਗੇ
- ਸਮਰੱਥਾ ਯੋਜਨਾ ਦੁਆਰਾ ਖਰਚੇ ਦੀ ਅਨੁਕੂਲਤਾ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋਗੇ
- ਕੋਟੇ ਦੀ ਵਰਤੋਂ ਅਤੇ ਸਰੋਤ ਉਪਲਬਧਤਾ ਲਈ ਚੇਤਾਵਨੀ ਅਤੇ ਨਿਗਰਾਨੀ ਕਨਫਿਗਰ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਉੱਤੇ, ਤੁਸੀਂ ਯੋਗ ਹੋਵੋਗੇ:
- ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ Azure ਸਰੋਤ ਸਮਰੱਥਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦਾ ਮੁਲਾਂਕਨ ਅਤੇ ਪ੍ਰਮਾਣਿਤ ਕਰਨਾ
- ਸਮਰੱਥਾ ਜਾਂਚ ਅਤੇ ਕੋਟੇ ਨਿਗਰਾਨੀ ਲਈ ਆਟੋਮੈਟਿਕ ਸਕ੍ਰਿਪਟ ਬਣਾਉਣਾ
- ਖੇਤਰੀ ਅਤੇ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੀਮਾਵਾਂ ਨੂੰ ਧਿਆਨ ਵਿੱਚ ਰੱਖਦੇ ਹੋਏ ਸਕੇਲ ਕਰਨ ਯੋਗ ਆਰਕੀਟੈਕਚਰ ਡਿਜ਼ਾਈਨ ਕਰਨਾ
- ਵੱਖ-ਵੱਖ ਵਰਕਲੋਡ ਕਿਸਮਾਂ ਲਈ ਖਰਚੇ-ਪ੍ਰਭਾਵੀ ਸਰੋਤ ਆਕਾਰ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰਨਾ
- ਸਮਰੱਥਾ-ਸਬੰਧੀ ਸਮੱਸਿਆਵਾਂ ਲਈ ਪ੍ਰੋ-ਐਕਟਿਵ ਨਿਗਰਾਨੀ ਅਤੇ ਚੇਤਾਵਨੀ ਕਨਫਿਗਰ ਕਰਨਾ
- ਸਹੀ ਸਮਰੱਥਾ ਵੰਡ ਨਾਲ ਬਹੁ-ਖੇਤਰੀ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਯੋਜਨਾ ਬਣਾਉਣਾ

## ਸਮਰੱਥਾ ਯੋਜਨਾ ਕਿਉਂ ਮਹੱਤਵਪੂਰਨ ਹੈ

ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ, ਤੁਹਾਨੂੰ ਇਹ ਯਕੀਨੀ ਬਣਾਉਣ ਦੀ ਜ਼ਰੂਰਤ ਹੈ:
- **ਕਾਫ਼ੀ ਕੋਟੇ** ਜ਼ਰੂਰੀ ਸਰੋਤਾਂ ਲਈ
- **ਸਰੋਤ ਉਪਲਬਧਤਾ** ਤੁਹਾਡੇ ਟਾਰਗਟ ਖੇਤਰ ਵਿੱਚ
- **ਸਰਵਿਸ ਟੀਅਰ ਉਪਲਬਧਤਾ** ਤੁਹਾਡੇ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਕਿਸਮ ਲਈ
- **ਨੈਟਵਰਕ ਸਮਰੱਥਾ** ਉਮੀਦ ਕੀਤੇ ਟ੍ਰੈਫਿਕ ਲਈ
- **ਖਰਚੇ ਦੀ ਅਨੁਕੂਲਤਾ** ਸਹੀ ਆਕਾਰ ਦੇ ਨਾਲ

## 📊 Azure ਕੋਟੇ ਅਤੇ ਸੀਮਾਵਾਂ ਦੀ ਸਮਝ

### ਸੀਮਾਵਾਂ ਦੇ ਕਿਸਮ
1. **ਸਬਸਕ੍ਰਿਪਸ਼ਨ-ਸਤਰ ਕੋਟੇ** - ਪ੍ਰਤੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਵੱਧ ਤੋਂ ਵੱਧ ਸਰੋਤ
2. **ਖੇਤਰੀ ਕੋਟੇ** - ਪ੍ਰਤੀ ਖੇਤਰ ਵੱਧ ਤੋਂ ਵੱਧ ਸਰੋਤ
3. **ਸਰੋਤ-ਵਿਸ਼ੇਸ਼ ਸੀਮਾਵਾਂ** - ਵਿਅਕਤੀਗਤ ਸਰੋਤ ਕਿਸਮਾਂ ਲਈ ਸੀਮਾਵਾਂ
4. **ਸਰਵਿਸ ਟੀਅਰ ਸੀਮਾਵਾਂ** - ਤੁਹਾਡੇ ਸਰਵਿਸ ਪਲਾਨ ਦੇ ਅਧਾਰ 'ਤੇ ਸੀਮਾਵਾਂ

### ਆਮ ਸਰੋਤ ਕੋਟੇ
```bash
# Check current quota usage
az vm list-usage --location eastus2 --output table

# Check specific resource quotas
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਸਮਰੱਥਾ ਜਾਂਚ

### ਆਟੋਮੈਟਿਕ ਸਮਰੱਥਾ ਪ੍ਰਮਾਣਿਕਤਾ ਸਕ੍ਰਿਪਟ
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

# Check various resource quotas
check_quota "compute" 4      # Need 4 vCPUs
check_quota "storage" 2      # Need 2 storage accounts
check_quota "network" 1      # Need 1 virtual network

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### ਸਰਵਿਸ-ਵਿਸ਼ੇਸ਼ ਸਮਰੱਥਾ ਜਾਂਚ

#### ਐਪ ਸਰਵਿਸ ਸਮਰੱਥਾ
```bash
# Check App Service Plan availability
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Check available SKUs in region
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
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

#### ਡਾਟਾਬੇਸ ਸਮਰੱਥਾ
```bash
# Check PostgreSQL capacity
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Check if SKU is available
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Show available SKUs
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Check Cosmos DB capacity
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Check region availability
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Check if serverless is supported (if needed)
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

#### ਕੰਟੇਨਰ ਐਪਸ ਸਮਰੱਥਾ
```bash
# Check Container Apps capacity
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Check if Container Apps is available in region
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Check current environment count
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps has a limit of 15 environments per region
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
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

## 📍 ਖੇਤਰੀ ਉਪਲਬਧਤਾ ਪ੍ਰਮਾਣਿਕਤਾ

### ਖੇਤਰ ਦੁਆਰਾ ਸਰਵਿਸ ਉਪਲਬਧਤਾ
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
            az postgres flexible-server list-skus --location eastus2 >/dev/null 2>&1 && \
            echo "PostgreSQL Flexible Server regions:" && \
            az account list-locations --query "[?metadata.regionType=='Physical'].{name:name,displayName:displayName}" -o table
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

### ਖੇਤਰ ਚੋਣ ਦੀਆਂ ਸਿਫਾਰਸ਼ਾਂ
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

## 💰 ਖਰਚੇ ਦੀ ਯੋਜਨਾ ਅਤੇ ਅਨੁਮਾਨ

### ਸਰੋਤ ਖਰਚੇ ਦਾ ਅਨੁਮਾਨ
```bash
# Estimate deployment costs
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Create a temporary resource group for estimation
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Deploy infrastructure in validation mode
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Clean up temporary resource group
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU ਅਨੁਕੂਲਤਾ ਸਿਫਾਰਸ਼ਾਂ
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

## 🚀 ਆਟੋਮੈਟਿਕ ਪ੍ਰੀ-ਫਲਾਈਟ ਜਾਂਚ

### ਵਿਸਤ੍ਰਿਤ ਪ੍ਰੀ-ਫਲਾਈਟ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# preflight-check.sh - Complete pre-deployment validation

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

# Storage account quota
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

# Check 4: Service availability
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

# Check 5: Network capacity
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
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### ਕਨਫਿਗਰੇਸ਼ਨ ਫਾਈਲ ਟੈਂਪਲੇਟ
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

## 📈 ਡਿਪਲੌਇਮੈਂਟ ਦੌਰਾਨ ਸਮਰੱਥਾ ਨਿਗਰਾਨੀ

### ਰੀਅਲ-ਟਾਈਮ ਸਮਰੱਥਾ ਨਿਗਰਾਨੀ
```bash
# Monitor capacity during deployment
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Check deployment status
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
        
        # Check current resource usage
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD ਨਾਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### azure.yaml ਵਿੱਚ ਪ੍ਰੀ-ਫਲਾਈਟ ਹੂਕਸ ਸ਼ਾਮਲ ਕਰੋ
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

## ਸਭ ਤੋਂ ਵਧੀਆ ਅਭਿਆਸ

1. **ਹਮੇਸ਼ਾ ਸਮਰੱਥਾ ਜਾਂਚ ਕਰੋ** ਨਵੇਂ ਖੇਤਰਾਂ ਵਿੱਚ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ
2. **ਕੋਟੇ ਦੀ ਵਰਤੋਂ ਨੂੰ ਨਿਯਮਿਤ ਤੌਰ 'ਤੇ ਨਿਗਰਾਨੀ ਕਰੋ** ਤਾਂ ਜੋ ਅਚਾਨਕ ਸਮੱਸਿਆਵਾਂ ਤੋਂ ਬਚਿਆ ਜਾ ਸਕੇ
3. **ਵਾਧੇ ਦੀ ਯੋਜਨਾ ਬਣਾਓ** ਭਵਿੱਖ ਦੀ ਸਮਰੱਥਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦੀ ਜਾਂਚ ਕਰਕੇ
4. **ਖਰਚੇ ਦੇ ਅਨੁਮਾਨ ਦੇ ਸੰਦ ਵਰਤੋ** ਬਿਲਿੰਗ ਸੰਬੰਧੀ ਚੌਕਾਂਟੇ ਤੋਂ ਬਚਣ ਲਈ
5. **ਸਮਰੱਥਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਨੂੰ ਦਸਤਾਵੇਜ਼ ਕਰੋ** ਆਪਣੀ ਟੀਮ ਲਈ
6. **ਸਮਰੱਥਾ ਪ੍ਰਮਾਣਿਕਤਾ ਨੂੰ ਆਟੋਮੈਟ ਕਰੋ** CI/CD ਪਾਈਪਲਾਈਨ ਵਿੱਚ
7. **ਖੇਤਰੀ ਫੇਲਓਵਰ** ਸਮਰੱਥਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਨੂੰ ਧਿਆਨ ਵਿੱਚ ਰੱਖੋ

## ਅਗਲੇ ਕਦਮ

- [SKU ਚੋਣ ਗਾਈਡ](sku-selection.md) - ਉਤਮ ਸਰਵਿਸ ਟੀਅਰ ਚੁਣੋ
- [ਪ੍ਰੀ-ਫਲਾਈਟ ਜਾਂਚ](preflight-checks.md) - ਆਟੋਮੈਟਿਕ ਪ੍ਰਮਾਣਿਕਤਾ ਸਕ੍ਰਿਪਟ
- [ਚੀਟ ਸ਼ੀਟ](../../resources/cheat-sheet.md) - ਤੇਜ਼ ਰਿਫਰੈਂਸ ਕਮਾਂਡ
- [ਗਲੋਸਰੀ](../../resources/glossary.md) - ਸ਼ਬਦ ਅਤੇ ਪਰਿਭਾਸ਼ਾਵਾਂ

## ਵਾਧੂ ਸਰੋਤ

- [Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੀਮਾਵਾਂ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure ਪ੍ਰਾਈਸਿੰਗ ਕੈਲਕੁਲੇਟਰ](https://azure.microsoft.com/pricing/calculator/)
- [Azure ਖਰਚੇ ਦਾ ਪ੍ਰਬੰਧਨ](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure ਖੇਤਰੀ ਉਪਲਬਧਤਾ](https://azure.microsoft.com/global-infrastructure/services/)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਡਿਬੱਗਿੰਗ ਗਾਈਡ](../troubleshooting/debugging.md)

- **ਅਗਲਾ ਪਾਠ**: [SKU ਚੋਣ](sku-selection.md)

---

**ਅਸਵੀਕਰਤਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਣੀਕਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤ ਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।