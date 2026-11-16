# ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ - ಅಜೂರ್ ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ ಮತ್ತು ಮಿತಿಗಳು

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [ಶುರು ಆಜೂರ್](../../README.md)
- **📖 ವರ್ತಮಾನ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 6 - ಪೂರ್ವ نشرಣೆ ಪರಿಶೀಲನೆ ಮತ್ತು ಯೋಜನೆ
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 5: ಬಹು-ಏಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../examples/retail-scenario.md)
- **➡️ ಮುಂದಿನದು**: [SKU ಆಯ್ಕೆ](sku-selection.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 7: ದೋಷನಿವಾರಣೆ](../chapter-07-troubleshooting/common-issues.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ, Azure ಡೆವಲಪರ್ CLI ಬಳಸಿ نشرಣೆ ಮಾಡುವ ಮುನ್ನ ಅಜೂರ್ ಸಂಪನ್ಮೂಲ ಸಾಮರ್ಥ್ಯವನ್ನು ಯೋಜಿಸಿ ಮತ್ತು ಪರಿಶೀಲಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ. ಕ್ವೋಟಾಗಳನ್ನು, ಲಭ್ಯತೆಯನ್ನು ಮತ್ತು ಪ್ರಾದೇಶಿಕ ಮಿತಿಗಳನ್ನು ಅಂದಾಜಿಸುವುದನ್ನು ಕಲಿಯಿರಿ, ಯಶಸ್ವಿ نشرಣೆಗಳಿಗೆ ಖರ್ಚು ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಅತ್ಯುತ್ತಮಗೊಳಿಸುತ್ತಾ. ವಿಭಿನ್ನ ಅಪ್ಲಿಕೇಶನ್ معماريಗಳು ಮತ್ತು ಪ್ರಮಾಣದ ದೃಶ್ಯಾವಳಿಗಳಿಗಾಗಿ ಸಾಮರ್ಥ್ಯ ಯೋಜನೆಯ ತಂತ್ರಗಳನ್ನು ಪರಿಣತಿಸಿರಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- ಅಜೂರ್ ಕ್ವೋಟಾಗಳು, ಮಿತಿಗಳು ಮತ್ತು ಪ್ರಾದೇಶಿಕ ಲಭ್ಯತೆ ಮಾರುಕಟ್ಟೆಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತೀರಿ
- نشرಣೆಗೆ ಮುನ್ನ ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ ಮತ್ತು ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲಿಸುವ ತಂತ್ರಗಳನ್ನು ಶಿಕ್ಷಿತರಾಗುವುದೆಂದೂ
- ಸ್ವಯಂಚಾಲಿತ ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲನೆ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಟಾನಮಾಡುತ್ತೀರಿ
- ಸರಿಯಾದ ಸಂಪನ್ಮೂಲ ಗಾತ್ರ ಮತ್ತು ಪ್ರಮಾಣ ನೀಡುವ ಯೋಚನೆಗಳೊಂದಿಗೆ ಅಪ್ಲಿಕೇಶನ್​ಗಳನ್ನು ವಿನ್ಯಾಸ ಮಾಡುತ್ತೀರಿ
- ಬುದ್ದಿಮತ್ತೆಯುಳ್ಳ ಸಾಮರ್ಥ್ಯ ಯೋಜನೆಯ ಮೂಲಕ ವೆಚ್ಚ ನಿರ್ವಹಣಾ ತಂತ್ರಗಳನ್ನು ಅನ್ವಯಿಸುತ್ತೀರಿ
- ಕ್ವೋಟಾ ಬಳಕೆ ಮತ್ತು ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆಯ ಅಲ್ಟರ್‌ಗಳು ಮತ್ತು ಮಾನಿಟರಿಂಗ್‌ಗಳನ್ನು ಸಂರಚಿಸುತ್ತೀರಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು:
- نشرಣೆಗೆ ಮುನ್ನ ಅಜೂರ್ ಸಂಪನ್ಮೂಲ ಸಾಮರ್ಥ್ಯ ಅಗತ್ಯಗಳನ್ನು ಅಂದಾಜಿಸಿ ಪರಿಶೀಲಿಸಬಹುದು
- ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲನೆ ಮತ್ತು ಕ್ವೋಟಾ ಮಾನಿಟರಿಂಗ್ ಗೆ ಸ್ವಯಂಚಾಲಿತ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ರಚಿಸಬಹುದು
- ಪ್ರಾದೇಶಿಕ ಮತ್ತು ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಮಿತಿಗಳನ್ನು ಗಮನಿಸಿದ ಸುಧಾರಿತ معماريಗಳನ್ನು ವಿನ್ಯಾಸ ಮಾಡಬಹುದು
- ವಿಭಿನ್ನ ಕೆಲಸದ ಪ್ರಕಾರಗಳಿಗೆ ವೆಚ್ಚ-ಕಾರ್ಯಕ್ಷಮ ಸಂಪನ್ಮೂಲ ಗಾತ್ರ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಟಾನ ಮಾಡಬಹುದು
- ಸಾಮರ್ಥ್ಯ ಸಂಬಂಧಿ ಸಮಸ್ಯೆಗಳಿಗೆ ಪ್ರಾಗತಿಕ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅಲ್ಟರಿಂಗ್ ಅನ್ನು ಸ್ಥಾಪಿಸಬಹುದು
- ಸರಿಯಾದ ಸಾಮರ್ಥ್ಯ ವಿತರಣೆ ಯೊಂದಿಗೆ ಬಹು-ಪ್ರಾಂತ نشرಣೆಗಳನ್ನು ಯೋಜಿಸಬಹುದು

## ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ ಮಹತ್ವ ಏಕೆ

> **ಗಾತ್ರ:** ಈ Bash ಉದಾಹರಣೆಗಳಿಗೆ ಅಜೂರ್ CLI, `jq` ಮತ್ತು ಆಯ್ಕೆಯಾದ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಅಗತ್ಯವಿದೆ. ಅವು ಪ್ರಕಟಿತ ಆಫರ್‌ಗಳು ಮತ್ತು ಕ್ವೋಟಾ ಪರಿಶೀಲಿಸುತ್ತವೆ; ಭೌತಿಕ ಸಾಮರ್ಥ್ಯವನ್ನು ಸಾಬೀತುಪಡಿಸುವುದಿಲ್ಲ ಅಥವಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಕಾಯ್ದಿರಿಸುವುದಿಲ್ಲ. ನಿಮ್ಮ ಸ್ವಂತ ಯೋಜನೆಯಲ್ಲಿ ಮನವಿ/ಹೊರಕ್ಕೆ ಹೊಂದಿಸಿ—ಕೆಳಗಿನ ಸ್ಕ್ರಿಪ್ಟ್/ಕಾನ್ಫಿಗ್ ಫೈಲ್ ಹೆಸರುಗಳು ಉದಾಹರಣೆಗಳಾಗಿವೆ, ಪರಿಶೀಲಿಸಲ್ಪಟ್ಟ ವಿತರಣೆಗಳು ಅಲ್ಲ. VM ಕ್ವೋಟಾಗಳು ಕಂಟೈನರ್ ಅಪ್ಸ್, ಅಪ್ ಸರ್ವಿಸ್ ಅಥವಾ ಅಜೂರ್ ಓಪನ್ AI ಕ್ವೋಟಾಗಳನ್ನು ಒಳಗೊಂಡಿಲ್ಲ.

ಅಪ್ಲಿಕೇಶನ್ نشرಣೆ ಮಾಡುವುದಿಲ್ಲ ಮುನ್ನ ನೀವು ಖಾತ್ರಿಪಡಿಸಬೇಕು:
- ಶೋಧಿಸಿದ ಸಂಪನ್ಮೂಲಗಳಿಗೆ **ತಕ್ಕಷ್ಟು ಕ್ವೋಟಾಗಳು**
- ನಿಮ್ಮ ಗುರಿ ಪ್ರಾಂತದಲ್ಲಿ **ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ**
- ನಿಮ್ಮ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಪ್ರಕಾರಕ್ಕಾಗಿ **ಸೇವಾ ಹಂತ ಲಭ್ಯತೆ**
- ನಿರೀಕ್ಷಿತ ಸಂಚಾರಕ್ಕಾಗಿ **ನೆಟ್ವರ್ಕ್ ಸಾಮರ್ಥ್ಯ**
- ಸರಿಯಾದ ಗಾತ್ರದ ಮೂಲಕ **ವೆಚ್ಚ ನಿರ್ವಹಣೆ**

## 📊 ಅಜೂರ್ ಕ್ವೋಟಾಗಳು ಮತ್ತು ಮಿತಿಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಮಿತಿಗಳ ಪ್ರಕಾರಗಳು
1. **ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್-ಮಟ್ಟದ ಕ್ವೋಟಾಗಳು** - ಪ್ರತಿಯೊಂದು ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್‌ಗೆ ಹೆಚ್ಚು ಹಣ
2. **ಪ್ರಾದೇಶಿಕ ಕ್ವೋಟಾಗಳು** - ಪ್ರತಿ ಪ್ರದೇಶಕ್ಕಾಗು ಹೆಚ್ಚು ಹಣ
3. **ಸಂಪನ್ಮೂಲ-ನಿಶ್ಚಿತ ಮಿತಿಗಳು** - ವೈಯಕ್ತಿಕ ಸಂಪನ್ಮೂಲ ಪ್ರಕಾರಗಳ ಮಿತಿಗಳು
4. **ಸೇವಾ ಹಂತ ಮಿತಿಗಳು** - ನಿಮ್ಮ ಸೇವಾ ಯೋಜನೆಯ ಆಧಾರದ ಮೇಲೆ ಮಿತಿಗಳು

### ಸಾಮಾನ್ಯ ಸಂಪನ್ಮೂಲ ಕ್ವೋಟಾಗಳು
```bash
# Check current quota usage
az vm list-usage --location eastus2 --output table

# Check specific resource quotas
az network list-usages --location eastus2 --output table
az storage account show-usage --location eastus2 --output table
```

## نشرಣೆಗೂ ಮುನ್ನ ಸಾಮರ್ಥ್ಯ ಪರೀಕ್ಷೆಗಳು

### ಸ್ವಯಂಚಾಲಿತ ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲನಾ ಸ್ಕ್ರಿಪ್ಟ್
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

### ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ಸಾಮರ್ಥ್ಯ ಪರೀಕ್ಷೆಗಳು

#### ಅಪ್ ಸರ್ವಿಸ್ ಸಾಮರ್ಥ್ಯ
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

#### ಡೇಟಾಬೇಸ್ ಸಾಮರ್ಥ್ಯ
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

#### ಕಂಟೈನರ್ ಅಪ್ಸ್ ಸಾಮರ್ಥ್ಯ
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

## 📍 ಪ್ರಾದೇಶಿಕ ಲಭ್ಯತೆ ಪರಿಶೀಲನೆ

### ಪ್ರಾದೇಶಿಕ ಸೇವಾ ಲಭ್ಯತೆ
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

### ಪ್ರಾದೇಶ ಆಯ್ಕೆ ಚರ್ಚೆ (ಚಿತ್ರಾತ್ಮಕ)

ಕೆಳಗಿನ ಲೇಬಲ್ಗಳು ಪರಿಶೀಲನೆಗೆ ಸೂಚನೆಗಳು, ಖಚಿತ ಬೆಲೆ, ಹಾರ್ಡ್‌ವೇರ್ ಅಥವಾ ಅನುಕೂಲランキング್ ಅಲ್ಲ. ಪ್ರಸ್ತುತ ಪ್ರಾದೇಶಿಕ ಬೆಲೆ ಮತ್ತು ಅಳೆಯಲಾದ ವಿಳಂಬವನ್ನು ಹೋಲಿಸಿ. GDPR ಗೆ ಜರ್ಮನಿ ಪ್ರದೇಶವು ವಿಶೇಷವಾಗಿ ಬೇಕಾಗಿಲ್ಲ; ನಿವಾಸ, ಸೇವಾ ವೈಶಿಷ್ಟ್ಯಗಳು ಮತ್ತು ಸಂಘ/org/ಕಾನೂನು ಅಗತ್ಯಗಳನ್ನು ಒಟ್ಟಿಗೆ ಅಂದಾಜಿಸಬೇಕು.
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

## 💰 ವೆಚ್ಚ ಯೋಜನೆ ಮತ್ತು ಅಂದಾಜು

### ಸಂಸಾಧನ ವೆಚ್ಚ ಅಂದಾಜು
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

### SKU ಗರಿಷ್ಠಯತೆ ಶಿಫಾರಸುಗಳು
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

## 🚀 ಸ್ವಯಂಚಾಲಿತ ಪೂರ್ವ-ಪ್ರಯಾಣ ಪರೀಕ್ಷೆಗಳು

### ಸಮಗ್ರ ಪೂರ್ವ-ಪ್ರಯಾಣ ಸ್ಕ್ರಿಪ್ಟ್
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

### ಕಾನ್ಫಿಗ್ ಫೈಲ್ ಟೆಂಪ್ಲೇಟು
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

## 📈 نشرಣೆ ವೇಳೆ ಸಾಮರ್ಥ್ಯ ಮಾನಿಟರಿಂಗ್

### ರಿಯಲ್-ಟೈಮ್ ಸಾಮರ್ಥ್ಯ ಮಾನಿಟರಿಂಗ್
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

## 🔗 AZD ಜೊತೆಗೆ ಏಕೀಕರಣ

### azure.yaml ಗೆ ಪೂರ್ವ-ಪ್ರಯಾಣ ಹೂಕ್ಸ್ ಸೇರ್ಪಡೆ
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

## ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

1. **ಹೊಸ ಪ್ರಾಂತಗಳಿಗೆ نشرಣೆ ಮಾಡುವ ಮುನ್ನ ಯಾವಾಗಲೂ ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲನೆಗಳನ್ನು ನಡೆಸಿ**
2. **ಆಶ್ಚರ್ಯಗಳೋರ್ಪಡಲು ಕ್ವೋಟಾ ಬಳಕೆಯನ್ನು ನಿಯಮಿತವಾಗಿ ಮಾನಿಟರ್ ಮಾಡಿ**
3. **ಭವಿಷ್ಯದ ಸಾಮರ್ಥ್ಯ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸುವ ಮೂಲಕ ಬೆಳವಣಿಗೆಗೆ ಯೋಜನೆ ಮಾಡಿ**
4. **ಬಿಲ್ ಶಾಕ್ ತಪ್ಪಿಸಲು ವೆಚ್ಚ ಅಂದಾಜು ಸಾಧನಗಳನ್ನು ಉಪಯೋಗಿಸಿ**
5. **ನಿಮ್ಮ ತಂಡಕ್ಕೆ ಸಾಮರ್ಥ್ಯ ಅಗತ್ಯಗಳನ್ನು ದಾಖಲೆ ಮಾಡಿ**
6. **CI/CD ಪೈಪ್ಲೈನ್ಗಳಲ್ಲಿ ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲನೆಯನ್ನು ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸಿ**
7. **ಪ್ರಾದೇಶಿಕ ಫೈಲ್ಓವರ್ ಸಾಮರ್ಥ್ಯ ಅಗತ್ಯಗಳನ್ನು ಪರಿಗಣಿಸಿ**

## ಮುಂದಿನ ಹಂತಗಳು

- [SKU ಆಯ್ಕೆ ಗೈಡ್](sku-selection.md) - ಸೂಕ್ತ ಸೇವಾ ಹಂತಗಳನ್ನು ಆರಿಸಿ
- [ಪೂರ್ವ-ಪ್ರಯಾಣ ಪರಿಶೀಲನೆಗಳು](preflight-checks.md) - ಸ್ವಯಂಚಾಲಿತ ಪರಿಶೀಲನಾ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
- [ಚೀಟ್ ಶೀಟ್](../../resources/cheat-sheet.md) - ವೇಗದ ಉಲ್ಲೇಖ ಆಜ್ಞಾನಗಳು
- [ಪದಕೋಶ](../../resources/glossary.md) - ಪದಗಳು ಮತ್ತು ವಿವರಣೆಗಳು

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

- [ಅಜೂರ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್ ಮಿತಿಗಳು](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [ಅಜೂರ್ ಬೆಲೆ ಗಣಕ](https://azure.microsoft.com/pricing/calculator/)
- [ಅಜೂರ್ ವೆಚ್ಚ ನಿರ್ವಹಣೆ](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [ಅಜೂರ್ ಪ್ರಾದೇಶಿಕ ಲಭ್ಯತೆ](https://azure.microsoft.com/global-infrastructure/services/)

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ಡಿಬಗಿಂಗ್ ಗೈಡ್](../chapter-07-troubleshooting/debugging.md)

- **ಮುಂದಿನ ಪಾಠ**: [SKU ಆಯ್ಕೆ](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->