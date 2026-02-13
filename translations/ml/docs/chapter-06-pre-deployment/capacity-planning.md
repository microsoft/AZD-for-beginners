# ശേഷി പ്ലാനിങ് - Azure റിസോഴ്‌സ് ലഭ്യതയും പരിധികളും

**Chapter Navigation:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലുള്ള അധ്യായം**: അധ്യായം 6 - മുൻ-ഡിപ്ലോയ്മെന്റ് സാധുത പരിശോധിക്കുകയും പ്ലാനിങ്ങ് ചെയ്യുകയും ചെയ്യൽ
- **⬅️ മുൻപ് ഉള്ള അധ്യായം**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **➡️ അടുത്തത്**: [SKU Selection](sku-selection.md)
- **🚀 അടുത്ത അധ്യായം**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## പരിചയം

ഈ സമഗ്ര ഗൈഡ് Azure Developer CLI ഉപയോഗിച്ച് ഡിപ്ലോയ്മെന്റ് നടത്തുന്നതിന് മുമ്പ് Azure റിസോഴ്‌സ് ശേഷി പ്ലാൻ ചെയ്തുള്ളും സാധുത പരിശോധിച്ചുള്ളും സഹായിക്കുന്നു. ക്വോട്ടകൾ, ലഭ്യത, പ്രാദേശിക പരിമിതികൾ എന്നിവ വിലയിരുത്തുകയെങ്ങനെ എന്ന് പഠിച്ച് വിജയകരമായ ഡിപ്ലോയ്മെന്റുകൾ ഉറപ്പാക്കുകയും ചെലവും പ്രകടതയും оптимൈസ് ചെയ്യുകയും ചെയ്യുക. വ്യത്യസ്ത അപ്ലിക്കേഷൻ ആർക്കിടെക്ചറുകളും സ്കെയ്ലിംഗ് senarios-നുള്ള ശേഷി പ്ലാനിങ് സാങ്കേതികതകൾ അധിഷ്ഠിതമായി കൈകാര്യം ചെയ്യുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കുന്നതിലൂടെ നിങ്ങൾക്ക്:
- Azure ക്വോട്ടുകൾ, പരിധികൾ, പ്രാദേശിക ലഭ്യത നിയന്ത്രണങ്ങൾ മനസ്സിലാക്കാൻ
- ഡിപ്ലോയ്മെന്റിന് മുമ്പ് റിസോഴ്‌സ് ലഭ്യതയും ശേഷിയും പരിശോധിക്കുന്ന സാങ്കേതികതകളിലേറ്റം പടിയെടുക്കാൻ
- ഓട്ടോമേറ്റഡ് ശേഷി സാധുതാസൂത്രണങ്ങളും നിരീക്ഷണ തന്ത്രങ്ങളും നടപ്പിലാക്കാൻ
- യഥാർത്ഥ റിസോഴ്‌സ് സൈസിംഗും സ്കെയ്ലിംഗ് പരിഗണനകളും ഉൾപ്പെടുത്തിയുള്ള ആപ്പ്ലിക്കേഷനുകൾ രൂപകൽപ്പന ചെയ്യാൻ
- ബുദ്ധിമുട്ടില്ലാതെ ശേഷി പ്ലാനിങ് വഴി ചെലവ് ഒപ്റ്റിമൈസേഷൻ നടപ്പാക്കാൻ
- ക്വോട്ടുകൾ ഉപയോഗവും റിസോഴ്‌സ് ലഭ്യതയുമിലുള്ള അലേർട്ടുകളും നിരീക്ഷണവും ക്രമീകരിക്കാൻ

## പഠന ഫലങ്ങൾ

പൂർത്തിയാക്കിയപ്പോൾ, നിങ്ങൾക്ക് കഴിയും:
- ഡിപ്ലോയ്മെന്റ് നടത്തുന്നതിന് മുമ്പ് Azure റിസോഴ്‌സ് ശേഷി ആവശ്യകതകൾ വിലയിരുത്താനും സാധുത പരിശോധിക്കാനും
- ശേഷി പരിശോധനയും ക്വോട്ടു നിരീക്ഷണത്തിനുമുള്ള ഓട്ടോമേറ്റഡ് സ്ക്രിപ്റ്റുകൾ സൃഷ്ടിക്കാനും
- പ്രാദേശികവും സബ്സ്ക്രിപ്ഷൻ പരിധികളുമെല്ലാമെനച്ച് സ്കാലബിൾ ആർക്കിടെക്ചറുകൾ രൂപകൽപ്പന ചെയ്യാനും
- വ്യത്യസ്ത ജോലിഭാര തരംಗಳಿಗೆ ചെലവുകുറഞ്ഞ റിസോഴ്‌സ് സൈസിംഗ് തന്ത്രങ്ങൾ നടപ്പിലാക്കാനും
- ശേഷിയുമായി ബന്ധപ്പെട്ട പ്രശ്നങ്ങൾക്കുള്ള പ്രോആക്റ്റീവ് നിരീക്ഷണം/അലേർട്ടിംഗ് ക്രമീകരിക്കാനും
- ശരിയായ ശേഷി വിതരണം നൽകി മൾട്ടി-സോൺ/മൾട്ടി-റിയോൺ ഡിപ്ലോയ്മെന്റുകൾ പദ്ധതിയിടാനും

## എന്തുകൊണ്ട് ശേഷി പ്ലാനിങ് പ്രാധാന്യം വഹിക്കുന്നത്

ആപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ് ചെയ്യുന്നതിന് മുൻപ് നിങ്ങൾ ഉറപ്പാക്കേണ്ടത്:
- ആവശ്യമായ റിസോഴ്‌സുകൾക്കുള്ള **ക്കഴിവുള്ള ക്വോട്ടുകൾ**
- ലക്ഷ്യ പ്രാദേശ്യത്തിൽ **റിസോഴ്‌സ് ലഭ്യത**
- നിങ്ങളുടെ സബ്സ്ക്രിപ്ഷൻ തരം కోసం **സേവന ടിയർ ലഭ്യത**
- പ്രതീക്ഷിച്ച ട്രാഫിക്കിനുള്ള **നെറ്റ്‌വർക്കിന്റെ ശേഷി**
- യഥാർത്ഥ സൈസിംഗ് വഴി **ചെലവ് ഒപ്റ്റിമൈസേഷൻ**

## 📊 Azure ക്വോട്ടുകളും പരിധികളും മനസ്സിലാക്കൽ

### പരിധികളുടെ തരം
1. **സബ്സ്ക്രിപ്ഷൻ-നിലവിലുള്ള ക്വോട്ടുകൾ** - ഒരു സബ്സ്ക്രിപ്ഷനിൽ പരമാവധി റിസോഴ്‌സുകൾ
2. **പ്രാദേശിക ക്വോട്ടുകൾ** - ഒരു പ്രാദേശ്യത്തിന് പരമാവധി റിസോഴ്‌സുകൾ
3. **റിസോഴ്‌സ്-നിർദ്ദിഷ്ട പരിധികൾ** - വ്യക്തിഗത റിസോഴ്‌സ് ടൈപ്പുകൾക്കുള്ള പരിധികൾ
4. **സേവന ടിയർ പരിധികൾ** - നിങ്ങളുടെ സേവന പ്ലാനിന്റെ അടിസ്ഥാനത്തിൽ പരിധികൾ

### പൊതുവായ റിസോഴ്‌സ് ക്വോട്ടുകൾ
```bash
# നിലവിലെ ക്വോട്ട ഉപയോഗം പരിശോധിക്കുക
az vm list-usage --location eastus2 --output table

# നിശ്ചിത റിസോഴ്‌സ് ക്വോട്ടുകൾ പരിശോധിക്കുക
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## ഡിപ്ലോയ്മെന്റിന് മുമ്പുള്ള ശേഷി പരിശോധനകൾ

### ഓട്ടോമേറ്റഡ് ശേഷി സാധുതാ സ്ക്രിപ്റ്റ്
```bash
#!/bin/bash
# capacity-check.sh - ഡിപ്ലോയ്‌മെന്റിന് മുമ്പ് Azure ശേഷി പരിശോധിക്കുക

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# ക്വോട്ടാ ഉപയോഗം പരിശോധിക്കുന്ന ഫംഗ്ഷൻ
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

# വിവിധ റിസോഴ്‌സ് ക്വോട്ടകൾ പരിശോധിക്കുക
check_quota "compute" 4      # 4 vCPUകൾ ആവശ്യമാണ്
check_quota "storage" 2      # 2 സ്റ്റോറേജ് അക്കൗണ്ടുകൾ ആവശ്യമാണ്
check_quota "network" 1      # 1 വർച്ച്വൽ നെറ്റ്‌വർക്ക് ആവശ്യമാണ്

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### സേവന-നിശ്ചിത ശേഷി പരിശോധനകൾ

#### App Service ശേഷി
```bash
# ആപ്പ് സർവീസ് പ്ലാൻ ലഭ്യത പരിശോധിക്കുക
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # പ്രദേശത്ത് ലഭ്യമായ SKU-കൾ പരിശോധിക്കുക
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # വൈകല്പിക പ്രദേശങ്ങൾ നിർദ്ദേശിക്കുക
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # നിലവിലെ ഉപയോഗം പരിശോധിക്കുക
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# ഉപയോഗം
check_app_service_capacity "eastus2" "P1v3"
```

#### ഡാറ്റാബേസ് ശേഷി
```bash
# PostgreSQL ശേഷി പരിശോധിക്കുക
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # SKU ലഭ്യമാണ് എന്ന് പരിശോധിക്കുക
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # ലഭ്യമായ SKUs കാണിക്കുക
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB ശേഷി പരിശോധിക്കുക
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # റീജിയന്റെ ലഭ്യത പരിശോധിക്കുക
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # ആവശ്യമാണെങ്കിൽ serverless പിന്തുണയുണ്ടോ എന്ന് പരിശോധിക്കുക
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

#### കണ്ടെയ്‌നർ ആപ്പുകളുടെ ശേഷി
```bash
# Container Apps ശേഷി പരിശോധിക്കുക
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Container Apps ആ പ്രദേശത്ത് ലഭ്യമായിട്ടുണ്ടോ എന്ന് പരിശോധിക്കുക
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # നിലവിലെ എൻവയോൺമെന്റുകളുടെ എണ്ണം പരിശോധിക്കുക
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps-ന് ഓരോ മേഖലക്കും 15 എൻവയോൺമെന്റുകളുടെ പരമാവധി പരിധി ഉണ്ട്
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # ലഭ്യമായ മേഖലകൾ കാണിക്കുക
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 പ്രാദേശിക ലഭ്യത പരിശോധിക്കൽ

### പ്രദേശങ്ങളനുസരിച്ചുള്ള സേവന ലഭ്യത
```bash
# പ്രദേശങ്ങളിലെ സേവനങ്ങളുടെ ലഭ്യത പരിശോധിക്കുക
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

# എല്ലാ സേവനങ്ങളും പരിശോധന ചെയ്‌യുക
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### പ്രദേശം തിരഞ്ഞെടുക്കുന്നതിനുള്ള ശുപാർശകൾ
```bash
# ആവശ്യകതകളുടെ അടിസ്ഥാനത്തിൽ ഏറ്റവും അനുയോജ്യമായ പ്രദേശങ്ങൾ ശുപാർശ ചെയ്യുക
recommend_region() {
    local requirements=$1  # "കുറഞ്ഞ ചെലവ്" | "പ്രവർത്തനക്ഷമത" | "നിയമാനുസൃതത"
    
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

## 💰 ചെലവ് പദ്ധതീകരണവും നിർണ്ണയവും

### റിസോഴ്‌സ് ചെലവ് നിർണ്ണയം
```bash
# ഡിപ്പ്ലോയ്മെന്റ് ചിലവുകൾ അനുമാനിക്കുക
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # അനുമാനത്തിനായി താൽക്കാലിക റിസോഴ്‌സ് ഗ്രൂപ്പ് സൃഷ്ടിക്കുക
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # പരിശോധനാ മോഡിൽ ഇൻഫ്രാസ്ട്രക്ചർ വിന്യസിക്കുക
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # താൽക്കാലിക റിസോഴ്‌സ് ഗ്രൂപ്പ് നീക്കം ചെയ്യുക
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU ഒപ്റ്റിമൈസേഷൻ ശുപാർശകൾ
```bash
# ആവശ്യകതകൾ അടിസ്ഥാനമാക്കി ഏറ്റവും അനുയോജ്യമായ SKUകൾ ശിപാർശ ചെയ്യുക
recommend_sku() {
    local service=$1
    local workload_type=$2  # "ഡെവ്" | "സ്റ്റേജിംഗ്" | "പ്രൊഡക്ഷൻ"
    
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

## 🚀 ഓട്ടോമേറ്റഡ് പ്രീ-ഫ്ലൈറ്റ് പരിശോധനകൾ

### സമഗ്ര പ്രീ-ഫ്ലൈറ്റ് സ്ക്രിപ്റ്റ്
```bash
#!/bin/bash
# preflight-check.sh - ഡിപ്ലോയ്‌മെന്റിന് മുൻപുള്ള സമഗ്ര പരിശോധന

set -e

# ക്രമീകരണം
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# ഔട്ട്പുട്ടിനുള്ള നിറങ്ങൾ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # നിറമില്ല

# ലോഗിംഗ് ഫംഗ്ഷനുകൾ
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# ക്രമീകരണം ലോഡ് ചെയ്യുക
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

# പരിശോധന 1: പ്രാമാണീകരണം
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# പരിശോധന 2: പ്രാദേശിക ലഭ്യത
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# പരിശോധന 3: ക്വോട്ടാ സാധുതാ പരിശോധന
log_info "Checking quota availability..."

# vCPU ക്വോട്ടാ
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

# സ്റ്റോറേജ് അക്കൗണ്ട് ക്വോട്ടാ
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

# പരിശോധന 4: സർവീസ് ലഭ്യത
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

# പരിശോധന 5: നെറ്റ്‌വർക്ക് ശേഷി
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

# പരിശോധന 6: റിസോഴ്‌സ് നാമകരണ പരിശോധന
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# പരിശോധന 7: ചെലവ് കണക്കാക്കൽ
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

# പരിശോധന 8: ടെംപ്ലേറ്റ് സാധുതാ പരിശോധന
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

# അവസാന സംഗ്രഹം
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### കോൺഫിഗറേഷൻ ഫയൽ ടെംപ്ലേറ്റ്
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

## 📈 ഡിപ്ലോയ്മെന്റിനിടെ ശേഷി നിരീക്ഷണം

### റിയൽ-ടൈം ശേഷി നിരീക്ഷണം
```bash
# ഡിപ്ലോയ്മെന്റ് സമയത്ത് ശേഷി നിരീക്ഷിക്കുക
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # ഡിപ്ലോയ്മെന്റിന്റെ നില പരിശോധിക്കുക
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
        
        # സ്രോതസുകളുടെ നിലവിലെ ഉപയോഗം പരിശോധിക്കുക
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD-യുമായി ഇന്റഗ്രേഷൻ

### azure.yaml-ലേക്ക് പ്രീ-ഫ്ലൈറ്റ് ഹൂകുകൾ ചേർക്കുക
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

## മികച്ച പ്രായോഗിക മാർഗങ്ങൾ

1. **എപ്പോഴും പുതിയ പ്രാദേശ്യങ്ങളിലേക്ക് ഡിപ്ലോയ് ചെയ്യുന്നതിന് മുമ്പ് ശേഷി പരിശോധനകൾ ഓടിക്കുക**
2. **അപ്രതീക്ഷിതതടസ്സങ്ങൾ ഒഴിവാക്കാൻ ക്വോട്ടു ഉപയോഗം নিয়മിതമായി നിരീക്ഷിക്കുക**
3. **വികസ്വിതാവസ്ഥയെ കണക്കിലെടുത്ത് വളർച്ചയ്ക്ക് പദ്ധതി രൂപീകരിക്കുക**
4. **ബിൽ ഷോക്ക് ഒഴിവാക്കാൻ ചെലവ് നിർണ്ണയം ഉപകരണങ്ങൾ ഉപയോഗിക്കുക**
5. **ടീമിന് വേണ്ടി ശേഷി ആവശ്യകതകൾ രേഖപ്പെടുത്തുക**
6. **CI/CD പൈപ്‌ലൈനുകളിൽ ശേഷി സാധുത ഓട്ടോമേറ്റ് ചെയ്യുക**
7. **പ്രാദേശിക ഫെയിൽഓവർ ശേഷി ആവശ്യകതകൾ പരിഗണിക്കുക**

## അടുത്ത ചുവടുകൾ

- [SKU Selection Guide](sku-selection.md) - മികച്ച സേവന ടിയർ തിരഞ്ഞെടുക്കുക
- [Pre-flight Checks](preflight-checks.md) - ഓട്ടോമേറ്റഡ് സാധുത പരിശോധനാ സ്ക്രിപ്റ്റുകൾ
- [Cheat Sheet](../../resources/cheat-sheet.md) - ഓടുവഴിയിലെ കമ്മാൻഡുകൾക്ക് ക്വിക്ക് റഫറൻസ്
- [Glossary](../../resources/glossary.md) - പദങ്ങളും നിർവചനങ്ങളും

## അധിക വിഭവങ്ങൾ

- [Azure Subscription Limits](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Cost Management](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure Regional Availability](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigation**
- **Previous Lesson**: [Debugging Guide](../chapter-07-troubleshooting/debugging.md)

- **Next Lesson**: [SKU Selection](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്‌ക്ലെയിമർ:
ഈ രേഖ AI പരിഭാഷ സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്ക് ശ്രമിച്ചിട്ടുണ്ടെങ്കിലും, യാന്ത്രികമായി ഉണ്ടാകുന്ന പരിഭാഷകൾ പിശകുകളോ അകൃത്യതകളോ ഉൾക്കൊണ്ടിരിക്കാമെന്ന点 ദയവായി ശ്രദ്ധിക്കുക. ഈ രേഖയുടെ മാതൃഭാഷയിലെ യഥാർത്ഥ പ്രമാണം പ്രാമാണികമായ ഉറവിടമായി നിലനില്ക്കണം. നിർണായകമായ വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ചതിന്റെ ഫലമായി ഉണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണകൾക്കും അർത്ഥവിനിമയ പിശകുകൾക്കും ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->