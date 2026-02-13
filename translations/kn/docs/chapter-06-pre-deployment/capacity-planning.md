# సామರ್ಥ್ಯ ಯೋಜನೆ - Azure ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ ಮತ್ತು ಮಿತಿಗಳು

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಂ**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 6 - ಪೂರ್ವ-ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಪರಿಶೀಲನೆ ಮತ್ತು ಯೋಜನೆ
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 5: ಬಹು-ಏಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../examples/retail-scenario.md)
- **➡️ ಮುಂದಿನ**: [SKU ಆಯ್ಕೆ](sku-selection.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 7: ತೊಂದರೆ ಪರಿಹಾರ](../chapter-07-troubleshooting/common-issues.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಗೈಡ್ Azure డెవಲಪర్ CLI ಉಪಯೋಗಿಸಿ ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಮುನ್ನ Azure ಸಂಪನ್ಮೂಲ ಸಾಮರ್ಥ್ಯವನ್ನು ಯೋಜಿಸಿ ಮತ್ತು ಮಾನ್ಯಗೊಳಿಸುವಲ್ಲಿ ಸಹಾಯ ಮಾಡುತ್ತದೆ. ಯಶಸ್ವಿ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್‌ಗಳಿಗೆ ಕೋಟಾಗಳು, ಲಭ್ಯತೆ ಮತ್ತು ಪ್ರಾದೇಶಿಕ ನಿರ್ಬಂಧಗಳನ್ನು ಅಂದಾಜು ಮಾಡುವುದು ಮತ್ತು ವೆಚ್ಚ ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡುವುದನ್ನು ಕಲಿಯಿರಿ. ವಿಭಿನ್ನ ಅಪ್ಲಿಕೇಶನ್ ವಾಸ್ತುಶಿಲ್ಪಗಳು ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಸನ್ನಿವೇಶಗಳಿಗಾಗಿ ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ ತಂತ್ರಗಳನ್ನು ನಿರ್ವಹಿಸಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಗೈಡ್ ಪೂರ್ಣಗೊಳಿಸಿಕೊಂಡ ನಂತರ, ನೀವು:
- Azure ಕೋಟಾಗಳು, ಮಿತಿಗಳು ಮತ್ತು ಪ್ರಾದೇಶಿಕ ಲಭ್ಯತಾ ನಿರ್ಬಂಧಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಡಿಪ್ಲಾಯ್ಮೆಂಟ್‌ಗಿಂತ ಮುನ್ನ ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ ಮತ್ತು ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲಿಸಲು ತಂತ್ರಗಳನ್ನು ಅಧ್ಯಯನಗೊಳಿಸುವುದು
- ಸ್ವಯಂಚಾಲಿತ ಸಾಮರ್ಥ್ಯ ಮಾನ್ಯತಾ ಮತ್ತು ಪರಿಶೀಲನಾ ರಣನೀತಿಗಳನ್ನು ಅನುಸರಿಸುವುದು
- ಸರಿಯಾದ ಸಂಪನ್ಮೂಲ ಅಳತೆ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಪರಿಗಣನೆಗಳೊಂದಿಗೆ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸುವುದು
- ಬುದ್ಧಿವಂತಿಕೆಯ ಮೂಲಕ ಸಾಮರ್ಥ್ಯ ಯೋಜನೆಯಿಂದ ವೆಚ್ಚ ಗುಣಮಟ್ಟದ ಸಮಂಜಸ್ಯವನ್ನು ಅನ್ವಯಿಸುವುದು
- ಕೋಟಾ ಬಳಕೆ ಮತ್ತು ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆಯಿಗಾಗಿ ಅಲರ್ಟ್‌ಗಳು ಮತ್ತು ಮಾಪನಗಳನ್ನು ಸಂರಚಿಸುವುದು

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೋಳದ ನಂತರ, ನೀವು ಸಾಧ್ಯವಾಗುತ್ತದೆ:
- ಡಿಪ್ಲಾಯ್ಮೆಂಟ್‌ಗಿಂತ ಮುನ್ನ Azure ಸಂಪನ್ಮೂಲ ಸಾಮರ್ಥ್ಯ ಅಗತ್ಯಗಳನ್ನು ಅಂದಾಜು ಮಾಡಿ ಮತ್ತು ಮಾನ್ಯಗೊಳಿಸಬಹುದು
- ಸಾಮರ್ಥ್ಯ ಪರೀಕ್ಷಿಸುವ ಮತ್ತು ಕೋಟಾ ಮಾನಿಟರ್ ಮಾಡುವ ಸ್ವಯಂಚಾಲಿತ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು ರಚಿಸಬಹುದು
- ಪ್ರಾದೇಶಿಕ ಮತ್ತು ಸಬ್‌ಸ್ಕ್ರಿಪ್ಷನ್ ಮಿತಿಗಳನ್ನು ಪರಿಗಣಿಸುವ ವಿಸ್ತಾರಗೊಳ್ಳುವ ವಾಸ್ತುಶಿಲ್ಪಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಬಹುದು
- ವಿಭಿನ್ನ ಕೆಲಸಭಾರ ಪ್ರಕಾರಗಳಿಗೆ ವೆಚ್ಚ-ಫಲಪ್ರದ ಸಂಪನ್ಮೂಲ ಅಳತೆಯ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಬಹುದು
- ಸಾಮರ್ಥ್ಯ ಸಂಬಂಧಿತ ಸಮಸ್ಯೆಗಳಿಗಾಗಿ ಪ್ರೊಆಕ್ಟಿವ್ ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಅಲರ್ಟಿಂಗ್ ಅನ್ನು ಸಂರಚಿಸಬಹುದು
- ಸೂಕ್ತ ಸಾಮರ್ಥ್ಯ ಹಂಚಿಕೆಯಿಂದ ಬಹು-ಪ್ರಾದೇಶಿಕ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್‌ಗಳನ್ನು ಯೋಜಿಸಬಹುದು

## ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ ಯಾಕೆ ಮುಖ್ಯ

ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಮೊದಲು, ನೀವು ಖಚಿತಪಡಿಸಿಕೊಳ್ಳಬೇಕು:
- ಅಗತ್ಯ ಸಂಪನ್ಮೂಲಗಳಿಗೆ **ಸಮರ್ಪಕ ಕೋಟಾಗಳು**
- ನಿಮ್ಮ ಗುರಿ ಪ್ರಾಂತ್ಯದಲ್ಲಿ **ಸಂಪನ್ಮೂಲ ಲಭ್ಯತೆ**
- ನಿಮ್ಮ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಷನ್ ಪ್ರಕಾರಕ್ಕೆ **ಸೇವಾ ಟಯರ್ ಲಭ್ಯತೆ**
- ನಿರೀಕ್ಷಿತ ಟ್ರಾಫಿಕ್‌ಗಾಗಿ **ನೆಟ್ವರ್ಕ್ ಸಾಮರ್ಥ್ಯ**
- ಸರಿಯಾದ ಅಳತೆಯ ಮೂಲಕ **ವೆಚ್ಚ ಆಪ್ಟಿಮೈಜೆಶನ್**

## 📊 Azure ಕೋಟಾಗಳು ಮತ್ತು ಮಿತಿಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಮಿತಿಗಳ ವಿಧಗಳು
1. **ಸಬ್‌ಸ್ಕ್ರಿಪ್ಷನ್-ಮಟ್ಟದ ಕೋಟಾಗಳು** - ಪ್ರತಿ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಷನ್‌ಗೆ ಗರಿಷ್ಠ ಸಂಪನ್ಮೂಲಗಳು
2. **ಪ್ರಾದೇಶಿಕ ಕೋಟಾಗಳು** - ಪ್ರತಿ ಪ್ರಾಂತ್ಯಕ್ಕೆ ಗರಿಷ್ಠ ಸಂಪನ್ಮೂಲಗಳು
3. **ಸಂಪನ್ಮೂಲ-ನಿರ್ದಿಷ್ಟ ಮಿತಿಗಳು** - ವೈಯಕ್ತಿಕ ಸಂಪನ್ಮೂಲ ಪ್ರಕಾರಗಳಿಗೆ ಮಿತಿಗಳು
4. **ಸೇವಾ ಟಯರ್ ಮಿತಿಗಳು** - ನಿಮ್ಮ ಸೇವಾ ಯೋಜನೆಯ ಆಧಾರದ ಮೇಲೆ ಮಿತಿಗಳು

### ಸಾಮಾನ್ಯ ಸಂಪನ್ಮೂಲ ಕೋಟಾಗಳು
```bash
# ಪ್ರಸ್ತುತ ಕೊಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az vm list-usage --location eastus2 --output table

# ನಿರ್ದಿಷ್ಟ ಸಂಪನ್ಮೂಲಗಳ ಕೊಟಾಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## ಡಿಪ್ಲಾಯ್ಮೆಂಟ್‌ಗಿಂತ ಮುನ್ನ ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲನೆಗಳು

### ಸ್ವಯಂಚಾಲಿತ ಸಾಮರ್ಥ್ಯ ಮಾನ್ಯತಾ ಸ್ಕ್ರಿಪ್ಟ್
```bash
#!/bin/bash
# capacity-check.sh - ನಿಯೋಜನೆಗೆ ಮೊದಲು Azure ಸಾಮರ್ಥ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# ಕ್ವೋಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸುವ ಕಾರ್ಯ
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

# ವಿವಿಧ ಸಂಪನ್ಮೂಲ ಕ್ವೋಟಾಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
check_quota "compute" 4      # 4 vCPUಗಳ ಅಗತ್ಯವಿದೆ
check_quota "storage" 2      # 2 ಸ್ಟೋರೇಜ್ ಖಾತೆಗಳ ಅಗತ್ಯವಿದೆ
check_quota "network" 1      # 1 ವರ್ಚುವಲ್ ನೆಟ್‌ವರ್ಕ್ ಅಗತ್ಯವಿದೆ

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲನೆಗಳು

#### ಅ್ಯಪ್ ಸರ್ವೀಸ್ ಸಾಮರ್ಥ್ಯ
```bash
# App Service Plan ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # ಪ್ರದೇಶದಲ್ಲಿ ಲಭ್ಯವಿರುವ SKUಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # ಪರ್ಯಾಯ ಪ್ರದೇಶಗಳನ್ನು ಸೂಚಿಸಿ
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # ಪ್ರಸ್ತುತ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# ಬಳಕೆ
check_app_service_capacity "eastus2" "P1v3"
```

#### ಡೇಟಾಬೇಸ್ ಸಾಮರ್ಥ್ಯ
```bash
# PostgreSQL ಸಾಮರ್ಥ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # SKU ಲಭ್ಯವಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # ಲಭ್ಯವಿರುವ SKUಗಳನ್ನು ತೋರಿಸಿ
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB ಸಾಮರ್ಥ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # ಪ್ರದೇಶದ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # serverless ಬೆಂಬಲಿತವಿದೆಯೇ ಎಂದು (ಅವಶ್ಯಕವಾದರೆ) ಪರಿಶೀಲಿಸಿ
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

#### ಕಂಟೇನರ್ ಅಪ್ಸ್ ಸಾಮರ್ಥ್ಯ
```bash
# Container Apps ಸಾಮರ್ಥ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Container Apps ಆ ಪ್ರಾಂತ್ಯದಲ್ಲಿ ಲಭ್ಯವಿದೆಯೇ ಎಂಬುದನ್ನು ಪರಿಶೀಲಿಸಿ
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # ಪ್ರಸ್ತುತ ಪರಿಸರದ ಸಂಖ್ಯೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Appsಗೆ ಪ್ರತಿ ಪ್ರಾಂತ್ಯಕ್ಕೆ 15 ಪರಿಸರಗಳ ಮಿತಿ ಇದೆ
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # ಲಭ್ಯವಿರುವ ಪ್ರಾಂತ್ಯಗಳನ್ನು ತೋರಿಸಿ
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 ಪ್ರಾದೇಶಿಕ ಲಭ್ಯತಾ ಪರಿಶೀಲನೆ

### ಪ್ರಾಂತ್ಯದ ಮೂಲಕ ಸೇವಾ ಲಭ್ಯತೆ
```bash
# ಪ್ರದೇಶಗಳಾದ್ಯಂತ ಸೇವೆಗಳ ಲಭ್ಯತೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
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

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### ಪ್ರಾಂತ್ಯ ಆಯ್ಕೆ ಶಿಫಾರಸುಗಳು
```bash
# ಅವಶ್ಯಕತೆಗಳ ಆಧಾರದ ಮೇಲೆ ಅತ್ಯುತ್ತಮ ಪ್ರದೇಶಗಳನ್ನು ಶಿಫಾರಸು ಮಾಡಿ
recommend_region() {
    local requirements=$1  # "ಕಡಿಮೆ ವೆಚ್ಚ" | "ಕಾರ್ಯಕ್ಷಮತೆ" | "ಅನುಪಾಲನೆ"
    
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

## 💰 ವೆಚ್ಚ ಯೋಜನೆ ಮತ್ತು ಅಂದಾಜು

### ಸಂಪನ್ಮೂಲ ವೆಚ್ಚ ಅಂದಾಜು
```bash
# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ವೆಚ್ಚಗಳನ್ನು ಅಂದಾಜು ಮಾಡಿ
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # ಅಂದಾಜಿಗಾಗಿ ತಾತ್ಕಾಲಿಕ ಸಂಪನ್ಮೂಲ ಗುಂಪನ್ನು ರಚಿಸಿ
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # ಮೂಲಸೌಕರ್ಯವನ್ನು ಪರಿಶೀಲನಾ ಮೋಡ್‌ನಲ್ಲಿ ನಿಯೋಜಿಸಿ
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # ತಾತ್ಕಾಲಿಕ ಸಂಪನ್ಮೂಲ ಗುಂಪನ್ನು ಅಳಿಸಿ
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU ಆಪ್ಟಿಮೈಜೆಶನ್ ಶಿಫಾರಸುಗಳು
```bash
# ಆವಶ್ಯಕತೆಗಳ ಆಧಾರದಲ್ಲಿ ಅತೀ ಸೂಕ್ತ SKUಗಳನ್ನು ಶಿಫಾರಸು ಮಾಡಿ
recommend_sku() {
    local service=$1
    local workload_type=$2  # "ಡೆವ್" | "ಸ್ಟೇಜಿಂಗ್" | "ಪ್ರೊಡಕ್ಷನ್"
    
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

## 🚀 ಸ್ವಯಂಚಾಲಿತ ಪೂರ್ವ-ಫ್ಲೈಟ್ ಪರೀಕ್ಷೆಗಳು

###Tudo ಸಮಗ್ರ ಪೂರ್ವ-ಫ್ಲೈಟ್ ಸ್ಕ್ರಿಪ್ಟ್
```bash
#!/bin/bash
# preflight-check.sh - ನಿಯೋಜನೆಯ ಮುನ್ನದ ಸಂಪೂರ್ಣ ಪರಿಶೀಲನೆ

set -e

# ಸಂರಚನೆ
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# ಔಟ್‌ಪುಟ್‌ಗಾಗಿ ಬಣ್ಣಗಳು
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # ಬಣ್ಣವಿಲ್ಲ

# ಲಾಗಿಂಗ್ ಕಾರ್ಯಗಳು
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# ಸಂರಚನೆಯನ್ನು ಲೋಡ್ ಮಾಡಿ
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

# ಪರಿಶೀಲನೆ 1: ಪ್ರಾಮಾಣೀಕರಣ
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# ಪರಿಶೀಲನೆ 2: ಪ್ರಾದೇಶಿಕ ಲಭ್ಯತೆ
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# ಪರಿಶೀಲನೆ 3: ಕ್ವೋಟಾ ಮಾನ್ಯತೆ
log_info "Checking quota availability..."

# vCPU ಕ್ವೋಟಾ
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

# ಸ್ಟೋರೇಜ್ ಖಾತೆ ಕ್ವೋಟಾ
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

# ಪರಿಶೀಲನೆ 4: ಸೇವಾ ಲಭ್ಯತೆ
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

# ಪರಿಶೀಲನೆ 5: ನೆಟ್‌ವರ್ಕ್ ಸಾಮರ್ಥ್ಯ
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

# ಪರಿಶೀಲನೆ 6: ಸಂಪನ್ಮೂಲ ಹೆಸರು ಮಾನ್ಯತೆ
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# ಪರಿಶೀಲನೆ 7: ವೆಚ್ಚದ ಅಂದಾಜು
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

# ಪರಿಶೀಲನೆ 8: ಟೆಂಪ್ಲೇಟ್ ಮಾನ್ಯತೆ
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

# ಅಂತಿಮ ಸಾರಾಂಶ
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### ಸಂರಚನೆ ಫೈಲ್ ಟೆಂಪ್ಲೇಟು
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

## 📈 ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ದವರೆ పాటు ಸಾಮರ್ಥ್ಯ ಸಂಸ್ಥಾಪನೆ

### ರಿಯಲ್-ಟೈಮ್ ಸಾಮರ್ಥ್ಯ ಮಾನಿಟರಿಂಗ್
```bash
# ಅನುಸ್ಥಾಪನೆಯ ವೇಳೆ ಸಾಮರ್ಥ್ಯವನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # ಅನುಸ್ಥಾಪನೆಯ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
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
        
        # ಪ್ರಸ್ತುತ ಸಂಪನ್ಮೂಲ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD ಜೊತೆಗೆ ಇಂಟಿಗ್ರೇಶನ್

### azure.yaml ಗೆ ಪೂರ್ವ-ಫ್ಲೈಟ್ ಹುಕ್‌ಗಳನ್ನು ಸೇರಿಸಿ
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

## ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

1. **ಎಲ್ಲಾ ಸಮಯದಲ್ಲೂ ಸಾಮರ್ಥ್ಯ ಪರಿಶೀಲನೆಗಳನ್ನು ನಡೆಸಿ** ಹೊಸ ಪ್ರಾಂತ್ಯಗಳಿಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಮೊದಲು
2. **ಕೋಟಾ ಬಳಕೆಯನ್ನು ನಿಯಮಿತವಾಗಿ ಗಮನಿಸಿ** ಅಚ್ಚರಿಗಳಿಗೆ ತಪ್ಪಿಸಿಕೊಳ್ಳಲು
3. **ವೃದ್ಧಿಗಾಗಿ ಯೋಜನೆ ಮಾಡಿ** ಭವಿಷ್ಯದ ಸಾಮರ್ಥ್ಯ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸುವ ಮೂಲಕ
4. **ಬೆಲೆ ಅಂದಾಜು ಸಾಧನಗಳನ್ನು ಬಳಸಿ** ಬಿಲ್ ಶಾಕ್ ತಪ್ಪಿಸಲು
5. **ನಿಮ್ಮ ತಂಡಕ್ಕೆ ಸಾಮರ್ಥ್ಯ ಅಗತ್ಯಗಳನ್ನು ದಾಖಲೆ ಮಾಡಿ**
6. **CI/CD ಪೈಪ್‌ಲೈನ್ಗಳಲ್ಲಿ ಸಾಮರ್ಥ್ಯ ಮಾನ್ಯತೆಯನ್ನು ಸ್ವಯಂಚಾಲಿತಗೊಳಿಸಿ**
7. **ಪ್ರಾದೇಶಿಕ ಫೇಲೋವರ್ ಸಾಮರ್ಥ್ಯ ಅಗತ್ಯಗಳನ್ನು ಪರಿಗಣಿಸಿ**

## ಮುಂದಿನ ಹಂತಗಳು

- [SKU Selection Guide](sku-selection.md) - ಸ್ವೋತ್ತಮ ಸೇವಾ ಟಯರ್‌ಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ
- [Pre-flight Checks](preflight-checks.md) - ಸ್ವಯಂಚಾಲಿತ ಮಾನ್ಯತಾ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
- [Cheat Sheet](../../resources/cheat-sheet.md) - ವೇಗದ ಉಲ್ಲೇಖ ಆಜ್ಞೆಗಳು
- [Glossary](../../resources/glossary.md) - ಪದಗಳು ಮತ್ತು ವ್ಯಾಖ್ಯಾನಗಳು

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

- [Azure Subscription Limits](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Cost Management](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure Regional Availability](https://azure.microsoft.com/global-infrastructure/services/)

---

**ನಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ಡಿಬ್ಬಗು ಮಾಡುವ ಗೈಡ್](../chapter-07-troubleshooting/debugging.md)

- **ಮುಂದಿನ ಪಾಠ**: [SKU ಆಯ್ಕೆ](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಜವಾಬ್ದಾರಿ ನಿರಾಕರಣೆ:
ಈ ದಾಖಲೆ ಅನ್ನು Co-op Translator (https://github.com/Azure/co-op-translator) ಎಂಬ ಕೃತಕ ಬುದ್ಧಿಮತ್ತೆ (AI) ಅನುವಾದ ಸೇವೆ ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಶುದ್ಧತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ ಸಹ ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡತೆಗಳು ಇರಬಹುದೆಂದನ್ನು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಾಖಲೆವನ್ನು ಅಧಿಕೃತ ಮತ್ತು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಮಾಡಿಕೆಗಳು ಅಥವಾ ತಪ್ಪಾಗಿ ವ್ಯಾಖ್ಯಾನಗಳಿಗಾಗಿ ನಾವು ಜವಾಬ್ದಾರರಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->