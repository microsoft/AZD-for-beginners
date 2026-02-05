# क्षमता योजना - Azure स्रोत उपलब्धता र सीमा

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 हालको अध्याय**: अध्याय ६ - पूर्व-परिनियोजन मान्यता र योजना
- **⬅️ अघिल्लो अध्याय**: [अध्याय ५: बहु-एजेन्ट AI समाधानहरू](../../examples/retail-scenario.md)
- **➡️ अर्को**: [SKU चयन](sku-selection.md)
- **🚀 अर्को अध्याय**: [अध्याय ७: समस्या समाधान](../troubleshooting/common-issues.md)

## परिचय

यो विस्तृत मार्गदर्शनले Azure Developer CLI प्रयोग गरेर परिनियोजन गर्नु अघि Azure स्रोत क्षमताको योजना र मान्यता गर्न मद्दत गर्दछ। कोटा, उपलब्धता, र क्षेत्रीय सीमाहरूको मूल्याङ्कन गर्न सिक्नुहोस् ताकि सफल परिनियोजन सुनिश्चित गर्न सकियोस्, साथै लागत र प्रदर्शनलाई अनुकूल बनाउन सकियोस्। विभिन्न अनुप्रयोग आर्किटेक्चर र स्केलिङ परिदृश्यहरूको लागि क्षमता योजना प्रविधिहरूमा निपुण बनौं।

## सिकाइ लक्ष्यहरू

यो मार्गदर्शन पूरा गरेर, तपाईं:
- Azure कोटा, सीमा, र क्षेत्रीय उपलब्धता सीमाहरू बुझ्नुहुनेछ
- परिनियोजन अघि स्रोत उपलब्धता र क्षमताको जाँच गर्ने प्रविधिहरूमा निपुण हुनुहुनेछ
- स्वचालित क्षमता मान्यता र अनुगमन रणनीतिहरू कार्यान्वयन गर्नुहुनेछ
- उचित स्रोत आकार र स्केलिङ विचारहरूको साथ अनुप्रयोगहरू डिजाइन गर्नुहुनेछ
- बुद्धिमानी क्षमता योजनाको माध्यमबाट लागत अनुकूलन रणनीतिहरू लागू गर्नुहुनेछ
- कोटा प्रयोग र स्रोत उपलब्धताका लागि अलर्ट र अनुगमन कन्फिगर गर्नुहुनेछ

## सिकाइ परिणामहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- परिनियोजन अघि Azure स्रोत क्षमताको आवश्यकता मूल्याङ्कन र मान्यता गर्न
- क्षमता जाँच र कोटा अनुगमनका लागि स्वचालित स्क्रिप्टहरू सिर्जना गर्न
- क्षेत्रीय र सदस्यता सीमाहरूलाई ध्यानमा राखेर स्केलेबल आर्किटेक्चरहरू डिजाइन गर्न
- विभिन्न कार्यभार प्रकारहरूको लागि लागत-प्रभावकारी स्रोत आकार रणनीतिहरू कार्यान्वयन गर्न
- क्षमतासँग सम्बन्धित समस्याहरूको लागि सक्रिय अनुगमन र अलर्ट कन्फिगर गर्न
- उचित क्षमता वितरणको साथ बहु-क्षेत्रीय परिनियोजन योजना गर्न

## किन क्षमता योजना महत्त्वपूर्ण छ

अनुप्रयोगहरू परिनियोजन गर्नु अघि, तपाईंले सुनिश्चित गर्नुपर्छ:
- आवश्यक स्रोतहरूको लागि **पर्याप्त कोटा**
- तपाईंको लक्षित क्षेत्रमा **स्रोत उपलब्धता**
- तपाईंको सदस्यता प्रकारको लागि **सेवा स्तर उपलब्धता**
- अपेक्षित ट्राफिकको लागि **नेटवर्क क्षमता**
- उचित आकारको माध्यमबाट **लागत अनुकूलन**

## 📊 Azure कोटा र सीमाहरू बुझ्दै

### सीमाहरूका प्रकार
1. **सदस्यता-स्तर कोटा** - प्रति सदस्यता अधिकतम स्रोतहरू
2. **क्षेत्रीय कोटा** - प्रति क्षेत्र अधिकतम स्रोतहरू
3. **स्रोत-विशिष्ट सीमा** - व्यक्तिगत स्रोत प्रकारहरूको लागि सीमा
4. **सेवा स्तर सीमा** - तपाईंको सेवा योजनामा आधारित सीमा

### सामान्य स्रोत कोटा
```bash
# वर्तमान कोटा प्रयोग जाँच गर्नुहोस्
az vm list-usage --location eastus2 --output table

# विशेष स्रोत कोटा जाँच गर्नुहोस्
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## पूर्व-परिनियोजन क्षमता जाँचहरू

### स्वचालित क्षमता मान्यता स्क्रिप्ट
```bash
#!/bin/bash
# capacity-check.sh - Azure क्षमता तैनाती अघि मान्य गर्नुहोस्

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# कोटा प्रयोग जाँच गर्नको लागि फङ्सन
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

# विभिन्न स्रोत कोटा जाँच गर्नुहोस्
check_quota "compute" 4      # ४ vCPUs आवश्यक छ
check_quota "storage" 2      # २ स्टोरेज खाता आवश्यक छ
check_quota "network" 1      # १ भर्चुअल नेटवर्क आवश्यक छ

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### सेवा-विशिष्ट क्षमता जाँचहरू

#### एप सेवा क्षमता
```bash
# एप सेवा योजना उपलब्धता जाँच गर्नुहोस्
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # क्षेत्रमा उपलब्ध SKU हरू जाँच गर्नुहोस्
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # वैकल्पिक क्षेत्रहरू सुझाव दिनुहोस्
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # वर्तमान प्रयोग जाँच गर्नुहोस्
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# प्रयोग
check_app_service_capacity "eastus2" "P1v3"
```

#### डाटाबेस क्षमता
```bash
# PostgreSQL क्षमता जाँच गर्नुहोस्
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # SKU उपलब्ध छ कि छैन जाँच गर्नुहोस्
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # उपलब्ध SKU हरू देखाउनुहोस्
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB क्षमता जाँच गर्नुहोस्
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # क्षेत्र उपलब्धता जाँच गर्नुहोस्
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # सर्वरलेस समर्थन गरिएको छ कि छैन जाँच गर्नुहोस् (यदि आवश्यक छ)
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

#### कन्टेनर एप्स क्षमता
```bash
# कन्टेनर एप्स क्षमता जाँच गर्नुहोस्
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # कन्टेनर एप्स क्षेत्रमा उपलब्ध छ कि छैन जाँच गर्नुहोस्
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # वर्तमान वातावरण गणना जाँच गर्नुहोस्
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # कन्टेनर एप्समा प्रति क्षेत्र १५ वातावरणको सीमा छ
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # उपलब्ध क्षेत्रहरू देखाउनुहोस्
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 क्षेत्रीय उपलब्धता मान्यता

### क्षेत्र अनुसार सेवा उपलब्धता
```bash
# क्षेत्रहरूमा सेवा उपलब्धता जाँच गर्नुहोस्
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

# सबै सेवाहरू जाँच गर्नुहोस्
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### क्षेत्र चयन सिफारिसहरू
```bash
# आवश्यकताहरूको आधारमा उपयुक्त क्षेत्रहरू सिफारिस गर्नुहोस्
recommend_region() {
    local requirements=$1  # "कम लागत" | "प्रदर्शन" | "अनुपालन"
    
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

## 💰 लागत योजना र अनुमान

### स्रोत लागत अनुमान
```bash
# परिनियोजन लागतको अनुमान गर्नुहोस्
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # अनुमानको लागि अस्थायी स्रोत समूह सिर्जना गर्नुहोस्
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # प्रमाणीकरण मोडमा पूर्वाधार परिनियोजन गर्नुहोस्
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # अस्थायी स्रोत समूह सफा गर्नुहोस्
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU अनुकूलन सिफारिसहरू
```bash
# आवश्यकताहरूको आधारमा उपयुक्त SKU हरू सिफारिस गर्नुहोस्
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

## 🚀 स्वचालित पूर्व-उडान जाँचहरू

### व्यापक पूर्व-उडान स्क्रिप्ट
```bash
#!/bin/bash
# preflight-check.sh - पूर्व-परिनियोजन मान्यकरण पूरा गर्नुहोस्

set -e

# कन्फिगरेसन
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# आउटपुटको लागि रंगहरू
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # कुनै रंग छैन

# लगिङ कार्यहरू
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# कन्फिगरेसन लोड गर्नुहोस्
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

# जाँच 1: प्रमाणीकरण
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# जाँच 2: क्षेत्रीय उपलब्धता
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# जाँच 3: कोटा मान्यकरण
log_info "Checking quota availability..."

# vCPU कोटा
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

# भण्डारण खाता कोटा
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

# जाँच 4: सेवा उपलब्धता
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

# जाँच 5: नेटवर्क क्षमता
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

# जाँच 6: स्रोत नामकरण मान्यकरण
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# जाँच 7: लागत अनुमान
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

# जाँच 8: टेम्प्लेट मान्यकरण
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

# अन्तिम सारांश
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### कन्फिगरेसन फाइल टेम्प्लेट
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

## 📈 परिनियोजनको क्रममा क्षमता अनुगमन

### वास्तविक-समय क्षमता अनुगमन
```bash
# परिनियोजनको क्रममा क्षमता अनुगमन गर्नुहोस्
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # परिनियोजन स्थिति जाँच गर्नुहोस्
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
        
        # वर्तमान स्रोतको प्रयोग जाँच गर्नुहोस्
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD सँग एकीकरण

### azure.yaml मा पूर्व-उडान हुकहरू थप्नुहोस्
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

## उत्कृष्ट अभ्यासहरू

1. **नयाँ क्षेत्रहरूमा परिनियोजन गर्नु अघि सधैं क्षमता जाँच गर्नुहोस्**
2. **कोटा प्रयोग नियमित रूपमा अनुगमन गर्नुहोस्** ताकि अप्रत्याशित समस्याहरू नआउन
3. **भविष्यको आवश्यकता अनुसार योजना बनाउनुहोस्** 
4. **लागत अनुमान उपकरणहरू प्रयोग गर्नुहोस्** ताकि अनावश्यक खर्चबाट बच्न सकियोस्
5. **तपाईंको टोलीका लागि क्षमता आवश्यकताहरू कागजात गर्नुहोस्**
6. **CI/CD पाइपलाइनहरूमा क्षमता मान्यता स्वचालित गर्नुहोस्**
7. **क्षेत्रीय फेलओभर क्षमताको आवश्यकता विचार गर्नुहोस्**

## अर्को कदमहरू

- [SKU चयन मार्गदर्शन](sku-selection.md) - उपयुक्त सेवा स्तरहरू चयन गर्नुहोस्
- [पूर्व-उडान जाँचहरू](preflight-checks.md) - स्वचालित मान्यता स्क्रिप्टहरू
- [चिट शीट](../../resources/cheat-sheet.md) - छिटो सन्दर्भ आदेशहरू
- [शब्दावली](../../resources/glossary.md) - शब्द र परिभाषाहरू

## थप स्रोतहरू

- [Azure सदस्यता सीमाहरू](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure मूल्य निर्धारण क्याल्कुलेटर](https://azure.microsoft.com/pricing/calculator/)
- [Azure लागत व्यवस्थापन](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure क्षेत्रीय उपलब्धता](https://azure.microsoft.com/global-infrastructure/services/)

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [डिबगिङ मार्गदर्शन](../troubleshooting/debugging.md)

- **अर्को पाठ**: [SKU चयन](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->