# ਸਮਰੱਥਾ ਯੋਜਨਾ - Azure ਸਰੋਤ ਉਪਲਬਧਤਾ ਅਤੇ ਸੀਮਾਵਾਂ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 6 - ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਵੈਰੀਫਿਕੇਸ਼ਨ ਅਤੇ ਯੋਜਨਾ
- **⬅️ ਪਿਛਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 5: ਬਹੁ-ਏਜੈਂਟ AI ਹੱਲ](../../examples/retail-scenario.md)
- **➡️ ਅਗਲਾ**: [SKU ਚੋਣ](sku-selection.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 7: ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ](../chapter-07-troubleshooting/common-issues.md)

## ਜਾਣਪਛਾਣ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ Azure Developer CLI ਨਾਲ ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ Azure ਸਰੋਤ ਸਮਰੱਥਾ ਦੀ ਯੋਜਨਾ ਬਣਾਉਣ ਅਤੇ ਵੈਰੀਫਾਈ ਕਰਨ ਵਿੱਚ ਸਹਾਇਤਾ ਕਰਦੀ ਹੈ। ਕੋਟਿਆਂ, ਉਪਲਬਧਤਾ ਅਤੇ ਖੇਤਰੀ ਸੀਮਾਵਾਂ ਦਾ ਅੰਕਲਣ ਕਰਨਾ ਸਿੱਖੋ ਤਾਂ ਜੋ ਡਿਪਲੋਇਮੈਂਟ ਸਫਲ ਹੋਣ ਅਤੇ ਲਾਗਤ ਅਤੇ ਕਾਰਗੁਜ਼ਾਰੀ ਦਾ ਅਨੁਕੂਲਨ ਕੀਤਾ ਜਾ ਸਕੇ। ਵੱਖ-ਵੱਖ ਐਪਲੀਕੇਸ਼ਨ ਆਰਕੀਟੈਕਚਰ ਅਤੇ ਸਕੇਲਿੰਗ ਸੈਨਾਰੀਆਂ ਲਈ ਸਮਰੱਥਾ ਯੋਜਨਾ ਤਕਨੀਕਾਂ 'ਤੇ ਨਿਪੁੰਨਤਾ ਹਾਸਲ ਕਰੋ।

## ਸੀਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਉਪਰਾਂਤ, ਤੁਸੀਂ:
- Azure ਕੋਟਿਆਂ, ਸੀਮਾਵਾਂ ਅਤੇ ਖੇਤਰੀ ਉਪਲਬਧਤਾ ਸੀਮਾਵਾਂ ਨੂੰ ਸਮਝੋ
- ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਸਰੋਤ ਉਪਲਬਧਤਾ ਅਤੇ ਸਮਰੱਥਾ ਜਾਂਚਣ ਦੀਆਂ ਤਕਨੀਕਾਂ ਵਿੱਚ ਮਾਹਿਰ ਹੋਵੋ
- ਆਟੋਮੇਟਡ ਸਮਰੱਥਾ ਵੈਰੀਫਿਕੇਸ਼ਨ ਅਤੇ ਮਾਨੀਟਰੀੰਗ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋ
- ਸਹੀ ਸਰੋਤ ਸਾਈਜ਼ਿੰਗ ਅਤੇ ਸਕੇਲਿੰਗ ਵਿਚਾਰਾਂ ਨਾਲ ਐਪਲੀਕੇਸ਼ਨਾਂ ਡਿਜ਼ਾਇਨ ਕਰੋ
- ਸਿਆਣੇ ਸਮਰੱਥਾ ਯੋਜਨਾ ਰਾਹੀਂ ਲਾਗਤ ਅਨੁਕੂਲਤਾ ਅਪਨਾਓ
- ਕੋਟਾ ਉਪਯੋਗ ਅਤੇ ਸਰੋਤ ਉਪਲਬਧਤਾ ਲਈ ਅਲਰਟ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਸੰਰਚਿਤ ਕਰੋ

## ਸੀਖਣ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਉਪਰਾਂਤ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ Azure ਸਰੋਤ ਸਮਰੱਥਾ ਦੀਆਂ ਲੋੜਾਂ ਦਾ ਅੰਕਲਨ ਅਤੇ ਵੈਧੀਕਰਨ ਕਰਨ ਲਈ
- ਸਮਰੱਥਾ ਜਾਂਚ ਅਤੇ ਕੋਟਾ ਮਾਨੀਟਰੀੰਗ ਲਈ ਆਟੋਮੇਟਡ ਸਕ੍ਰਿਪਟ ਬਣਾਉਣ ਲਈ
- ਖੇਤਰੀ ਅਤੇ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੀਮਾਵਾਂ ਨੂੰ ਧਿਆਨ ਵਿੱਚ ਰੱਖਦਿਆਂ ਸਕੇਲ ਕਰਨ ਯੋਗ ਆਰਕੀਟੈਕਚਰ ਡਿਜ਼ਾਇਨ ਕਰਨ ਲਈ
- ਵੱਖ-ਵੱਖ ਵਰਕਲੋਡ ਕਿਸਮਾਂ ਲਈ ਲਾਗਤ-ਕੁਸ਼ਲ ਸਰੋਤ ਸਾਈਜ਼ਿੰਗ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰਨ ਲਈ
- ਸਮਰੱਥਾ-ਸੰਬੰਧੀ ਮੁੱਦਿਆਂ ਲਈ ਪ੍ਰੋਐਕਟਿਵ ਮਾਨੀਟਰੀੰਗ ਅਤੇ ਅਲਰਟਿੰਗ ਸੰਰਚਿਤ ਕਰਨ ਲਈ
- ਢੁਕਵੀਂ ਸਮਰੱਥਾ ਵੰਡ ਨਾਲ ਮਲਟੀ-ਰੀਅਤ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਯੋਜਨਾ ਬਣਾਉਣ ਲਈ

## ਕਿਉਂ ਕੈਪੇਸਿਟੀ ਯੋਜਨਾ ਮਹੱਤਵਪੂਰਨ ਹੈ

ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇਮ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਤੁਹਾਨੂੰ ਇਹ ਯਕੀਨੀ ਬਣਾਉਣਾ ਚਾਹੀਦਾ ਹੈ:
- **ਜਰੂਰੀ ਸਰੋਤਾਂ ਲਈ ਪ੍ਰਯਾਪਤ ਕੋਟਾ**
- **ਲੱਕੜੇ ਖੇਤਰ ਵਿੱਚ ਸਰੋਤ ਉਪਲਬਧਤਾ**
- **ਤੁਹਾਡੇ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਕਿਸਮ ਲਈ ਸੇਵਾ ਸਤਰ ਉਪਲਬਧਤਾ**
- **ਉਮੀਦ ਕੀਤੇ ਟ੍ਰੈਫਿਕ ਲਈ ਨੈੱਟਵਰਕ ਸਮਰੱਥਾ**
- **ਸਹੀ ਸਾਈਜ਼ਿੰਗ ਰਾਹੀਂ ਲਾਗਤ ਅਨੁਕੂਲਤਾ**

## 📊 Azure ਕੋਟਾ ਅਤੇ ਸੀਮਾਵਾਂ ਨੂੰ ਸਮਝਣਾ

### ਸੀਮਾਵਾਂ ਦੀਆਂ ਕਿਸਮਾਂ
1. **ਸਬਸਕ੍ਰਿਪਸ਼ਨ-ਸਤਹ ਕੋਟਾ** - ਪ੍ਰਤੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਵੱਧ ਤੋਂ ਵੱਧ ਸਰੋਤ
2. **ਖੇਤਰੀ ਕੋਟਾ** - ਪ੍ਰਤੀ ਖੇਤਰ ਵੱਧ ਤੋਂ ਵੱਧ ਸਰੋਤ
3. **ਸੰਸਾਧਨ-ਖਾਸ ਸੀਮਾਵਾਂ** - ਵਿਅਕਤੀਗਤ ਸਰੋਤ ਕਿਸਮਾਂ ਲਈ ਸੀਮਾਵਾਂ
4. **ਸੇਵਾ ਸਤਰ ਸੀਮਾਵਾਂ** - ਤੁਹਾਡੇ ਸੇਵਾ ਯੋਜਨਾ ਅਧਾਰਿਤ ਸੀਮਾਵਾਂ

### ਆਮ ਸੰਸਾਧਨ ਕੋਟਾ
```bash
# ਮੌਜੂਦਾ ਕੋਟਾ ਦੀ ਵਰਤੋਂ ਚੈੱਕ ਕਰੋ
az vm list-usage --location eastus2 --output table

# ਖਾਸ ਸਰੋਤਾਂ ਦੇ ਕੋਟੇ ਚੈੱਕ ਕਰੋ
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਦੀ ਸਮਰੱਥਾ ਜਾਂਚ

### ਆਟੋਮੇਟਡ ਸਮਰੱਥਾ ਜਾਂਚ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# capacity-check.sh - ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ Azure ਦੀ ਸਮਰੱਥਾ ਦੀ ਜਾਂਚ ਕਰੋ

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# ਕੋਟਾ ਉਪਯੋਗ ਦੀ ਜਾਂਚ ਕਰਨ ਲਈ ਫੰਕਸ਼ਨ
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

# ਵੱਖ-ਵੱਖ ਸਰੋਤ ਕੋਟਿਆਂ ਦੀ ਜਾਂਚ ਕਰੋ
check_quota "compute" 4      # 4 vCPU ਦੀ ਲੋੜ ਹੈ
check_quota "storage" 2      # 2 ਸਟੋਰੇਜ ਅਕਾਊਂਟ ਦੀ ਲੋੜ ਹੈ
check_quota "network" 1      # 1 ਵਰਚੁਅਲ ਨੈੱਟਵਰਕ ਦੀ ਲੋੜ ਹੈ

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### ਸੇਵਾ-ਵਿਸ਼ੇਸ਼ ਸਮਰੱਥਾ ਜਾਂਚਾਂ

#### App Service ਸਮਰੱਥਾ
```bash
# App Service Plan ਦੀ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # ਖੇਤਰ ਵਿੱਚ ਉਪਲਬਧ SKUs ਦੀ ਜਾਂਚ ਕਰੋ
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # ਵਿਕਲਪਿਕ ਖੇਤਰ ਸੁਝਾਓ
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # ਮੌਜੂਦਾ ਵਰਤੋਂ ਦੀ ਜਾਂਚ ਕਰੋ
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# ਵਰਤੋਂ
check_app_service_capacity "eastus2" "P1v3"
```

#### ਡੇਟਾਬੇਸ ਸਮਰੱਥਾ
```bash
# PostgreSQL ਦੀ ਸਮਰੱਥਾ ਚੈੱਕ ਕਰੋ
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # ਚੈੱਕ ਕਰੋ ਕਿ SKU ਉਪਲੱਬਧ ਹੈ ਜਾਂ ਨਹੀਂ
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # ਉਪਲੱਬਧ SKU ਦਿਖਾਓ
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB ਦੀ ਸਮਰੱਥਾ ਚੈੱਕ ਕਰੋ
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # ਰੀਜਨ ਦੀ ਉਪਲੱਬਧਤਾ ਚੈੱਕ ਕਰੋ
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # ਚੈੱਕ ਕਰੋ ਕਿ serverless ਸਮਰਥਿਤ ਹੈ ਜਾਂ ਨਹੀਂ (ਜੇ ਲੋੜ ਹੋਵੇ)
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

#### Container Apps ਸਮਰੱਥਾ
```bash
# Container Apps ਦੀ ਸਮਰੱਥਾ ਜਾਂਚੋ
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # ਚੈੱਕ ਕਰੋ ਕਿ Container Apps ਇਸ ਰੀਜਨ ਵਿੱਚ ਉਪਲਬਧ ਹੈ ਜਾਂ ਨਹੀਂ
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # ਮੌਜੂਦਾ ਵਾਤਾਵਰਣਾਂ ਦੀ ਗਿਣਤੀ ਜਾਂਚੋ
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps ਲਈ ਹਰ ਰੀਜਨ ਵਿੱਚ 15 ਵਾਤਾਵਰਣਾਂ ਦੀ ਸੀਮਾ ਹੈ
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # ਉਪਲਬਧ ਰੀਜਨ ਦਿਖਾਓ
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 ਖੇਤਰੀ ਉਪਲਬਧਤਾ ਜਾਂਚ

### ਖੇਤਰ ਵਾਰ ਸੇਵਾ ਉਪਲਬਧਤਾ
```bash
# ਖੇਤਰਾਂ ਵਿੱਚ ਸੇਵਾਵਾਂ ਦੀ ਉਪਲਬਧਤਾ ਜਾਂਚੋ
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

# ਸਭ ਸੇਵਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### ਖੇਤਰ ਚੁਣਨ ਲਈ ਸੁਝਾਅ
```bash
# ਲੋੜਾਂ ਦੇ ਆਧਾਰ ਤੇ ਉੱਤਮ ਖੇਤਰਾਂ ਦੀ ਸਿਫਾਰਸ਼ ਕਰੋ
recommend_region() {
    local requirements=$1  # "ਘੱਟ ਲਾਗਤ" | "ਕਾਰਗੁਜ਼ਾਰੀ" | "ਅਨੁਸਰਣ"
    
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

## 💰 ਲਾਗਤ ਯੋਜਨਾ ਅਤੇ ਅਨੁਮਾਨ

### ਸਰੋਤ ਲਾਗਤ ਦਾ ਅਨੁਮਾਨ
```bash
# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਲਾਗਤ ਦਾ ਅੰਦਾਜ਼ਾ ਲਗਾਓ
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # ਅੰਦਾਜ਼ੇ ਲਈ ਇੱਕ ਅਸਥਾਈ ਸੰਸਾਧਨ ਗਰੁੱਪ ਬਣਾਓ
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # ਤਸਦੀਕ ਮੋਡ ਵਿੱਚ ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਤੈਨਾਤ ਕਰੋ
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # ਅਸਥਾਈ ਸੰਸਾਧਨ ਗਰੁੱਪ ਨੂੰ ਸਾਫ਼ ਕਰੋ
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU ਅਨੁਕੂਲਤਾ ਲਈ ਸੁਝਾਅ
```bash
# ਲੋੜਾਂ ਦੇ ਆਧਾਰ ਤੇ ਸਭ ਤੋਂ ਉੱਤਮ SKUs ਦੀ ਸਿਫਾਰਿਸ਼ ਕਰੋ
recommend_sku() {
    local service=$1
    local workload_type=$2  # "ਡੈਵ" | "ਸਟੇਜਿੰਗ" | "ਪ੍ਰੋਡਕਸ਼ਨ"
    
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

## 🚀 ਆਟੋਮੇਟਡ ਪ੍ਰੀ-ਫਲਾਈਟ ਜਾਂਚਾਂ

### ਵਿਆਪਕ ਪ੍ਰੀ-ਫਲਾਈਟ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# preflight-check.sh - ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਦੀ ਪੂਰੀ ਵੈਲੀਡੇਸ਼ਨ

set -e

# ਸੰਰਚਨਾ
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# ਆਊਟਪੁੱਟ ਲਈ ਰੰਗ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # ਕੋਈ ਰੰਗ ਨਹੀਂ

# ਲੌਗਿੰਗ ਫੰਕਸ਼ਨ
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# ਸੰਰਚਨਾ ਲੋਡ ਕਰੋ
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

# ਚੈੱਕ 1: ਪ੍ਰਮਾਣਿਕਤਾ
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# ਚੈੱਕ 2: ਖੇਤਰੀ ਉਪਲਬਧਤਾ
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# ਚੈੱਕ 3: ਕੋਟਾ ਵੈਧਤਾ
log_info "Checking quota availability..."

# vCPU ਕੋਟਾ
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

# ਸਟੋਰੇਜ ਖਾਤਾ ਕੋਟਾ
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

# ਚੈੱਕ 4: ਸੇਵਾ ਉਪਲਬਧਤਾ
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

# ਚੈੱਕ 5: ਨੈੱਟਵਰਕ ਸਮਰੱਥਾ
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

# ਚੈੱਕ 6: ਰਿਸੋਰਸ ਨਾਮਕਰਨ ਵੈਧਤਾ
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# ਚੈੱਕ 7: ਲਾਗਤ ਅਨੁਮਾਨ
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

# ਚੈੱਕ 8: ਟੈਂਪਲੇਟ ਵੈਧਤਾ
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

# ਅੰਤਿਮ ਸਾਰਾਂਸ਼
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### ਸੰਰਚਨਾ ਫਾਇਲ ਟੈਮਪਲੇਟ
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

## 📈 ਡਿਪਲੋਇਮੈਂਟ ਦੌਰਾਨ ਸਮਰੱਥਾ ਦੀ ਨਿਗਰਾਨੀ

### ਰੀਅਲ-ਟਾਈਮ ਸਮਰੱਥਾ ਨਿਗਰਾਨੀ
```bash
# ਤੈਨਾਤੀ ਦੌਰਾਨ ਸਮਰੱਥਾ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # ਤੈਨਾਤੀ ਦੀ ਸਥਿਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
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
        
        # ਮੌਜੂਦਾ ਸਰੋਤ ਵਰਤੋਂ ਦੀ ਜਾਂਚ ਕਰੋ
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD ਨਾਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### azure.yaml ਵਿੱਚ ਪ੍ਰੀ-ਫਲਾਈਟ ਹੂਕ ਜੋੜੋ
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

## ਸਰਵੋਤਮ ਅਭਿਆਸ

1. **ਹਮੇਸ਼ਾਂ ਸਮਰੱਥਾ ਜਾਂਚ ਕਰੋ** ਨਵੇਂ ਖੇਤਰਾਂ ਵਿੱਚ ਡਿਪਲੋਇਮੈਂਟ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ
2. **ਕੋਟਾ ਉਪਯੋਗ ਨੂੰ ਨਿਯਮਤ ਤੌਰ 'ਤੇ ਮਾਨੀਟਰ ਕਰੋ** ਤਾਂ ਜੋ ਅਚਾਨਕ ਮੁਸੀਬਤੋਂ ਬਚਜਾਏ
3. **ਵਿਕਾਸ ਲਈ ਯੋਜਨਾ ਬਣਾਓ** ਭਵਿੱਖੀ ਸਮਰੱਥਾ ਦੀ ਲੋੜਾਂ ਦੀ ਜਾਂਚ ਕਰਕੇ
4. **ਬਿੱਲ ਸ਼ਾਕ ਤੋਂ ਬਚਣ ਲਈ ਲਾਗਤ ਅਨੁਮਾਨ ਟੂਲ ਵਰਤੋਂ**
5. **ਆਪਣੀ ਟੀਮ ਲਈ ਸਮਰੱਥਾ ਲੋੜਾਂ ਦਾ ਦਸਤਾਵੇਜ਼ ਬਣਾਓ**
6. **CI/CD ਪਾਈਪਲਾਈਨਾਂ ਵਿੱਚ ਸਮਰੱਥਾ ਵੈਰੀਫਿਕੇਸ਼ਨ ਆਟੋਮੇਟ ਕਰੋ**
7. **ਖੇਤਰੀ ਫੇਲਓਵਰ ਦੀ ਸਮਰੱਥਾ ਲੋੜਾਂ ਬਾਰੇ ਸੋਚੋ**

## ਅਗਲੇ ਕਦਮ

- [SKU ਚੋਣ ਗਾਈਡ](sku-selection.md) - ਅਨੁਕੂਲ ਸੇਵਾ ਸਤਰ ਚੁਣੋ
- [ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈਕਸ](preflight-checks.md) - ਆਟੋਮੇਟਡ ਵੈਰੀਫਿਕੇਸ਼ਨ ਸਕ੍ਰਿਪਟ
- [ਚੀਟ ਸ਼ੀਟ](../../resources/cheat-sheet.md) - ਤੇਜ਼ ਸੰਦੇਸ਼ ਕਮਾਂਡ
- [ਗਲੋਸਰੀ](../../resources/glossary.md) - ਸ਼ਬਦਾਵਲੀ ਅਤੇ ਪਰਿਭਾਸ਼ਾਵਾਂ

## ਵਾਧੂ ਸਰੋਤ

- [Azure Subscription Limits](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Cost Management](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure Regional Availability](https://azure.microsoft.com/global-infrastructure/services/)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਡਿਬੱਗਿੰਗ ਗਾਈਡ](../chapter-07-troubleshooting/debugging.md)

- **ਅਗਲਾ ਪਾਠ**: [SKU ਚੋਣ](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਡਿਸਕਲੇਮਰ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੈਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਤਰੁੱਟੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਣ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਨਾਲ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->