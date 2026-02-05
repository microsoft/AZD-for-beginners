# क्षमता योजना - Azure संसाधन उपलब्धता और सीमाएँ

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 6 - पूर्व-परिनियोजन सत्यापन और योजना
- **⬅️ पिछला अध्याय**: [अध्याय 5: मल्टी-एजेंट एआई समाधान](../../examples/retail-scenario.md)
- **➡️ अगला**: [SKU चयन](sku-selection.md)
- **🚀 अगला अध्याय**: [अध्याय 7: समस्या निवारण](../troubleshooting/common-issues.md)

## परिचय

यह व्यापक गाइड आपको Azure Developer CLI के साथ परिनियोजन से पहले Azure संसाधन क्षमता की योजना बनाने और सत्यापित करने में मदद करता है। कोटा, उपलब्धता और क्षेत्रीय सीमाओं का आकलन करना सीखें ताकि लागत और प्रदर्शन को अनुकूलित करते हुए सफल परिनियोजन सुनिश्चित किया जा सके। विभिन्न एप्लिकेशन आर्किटेक्चर और स्केलिंग परिदृश्यों के लिए क्षमता योजना तकनीकों में महारत हासिल करें।

## सीखने के लक्ष्य

इस गाइड को पूरा करने के बाद, आप:
- Azure कोटा, सीमाओं और क्षेत्रीय उपलब्धता बाधाओं को समझेंगे
- परिनियोजन से पहले संसाधन उपलब्धता और क्षमता की जांच करने की तकनीकों में महारत हासिल करेंगे
- स्वचालित क्षमता सत्यापन और निगरानी रणनीतियों को लागू करेंगे
- उचित संसाधन आकार और स्केलिंग विचारों के साथ एप्लिकेशन डिज़ाइन करेंगे
- बुद्धिमान क्षमता योजना के माध्यम से लागत अनुकूलन रणनीतियों को लागू करेंगे
- कोटा उपयोग और संसाधन उपलब्धता के लिए अलर्ट और निगरानी कॉन्फ़िगर करेंगे

## सीखने के परिणाम

पूरा करने के बाद, आप सक्षम होंगे:
- परिनियोजन से पहले Azure संसाधन क्षमता आवश्यकताओं का आकलन और सत्यापन करें
- क्षमता जांच और कोटा निगरानी के लिए स्वचालित स्क्रिप्ट बनाएं
- क्षेत्रीय और सब्सक्रिप्शन सीमाओं को ध्यान में रखते हुए स्केलेबल आर्किटेक्चर डिज़ाइन करें
- विभिन्न वर्कलोड प्रकारों के लिए लागत प्रभावी संसाधन आकार रणनीतियों को लागू करें
- क्षमता से संबंधित मुद्दों के लिए सक्रिय निगरानी और अलर्टिंग कॉन्फ़िगर करें
- उचित क्षमता वितरण के साथ बहु-क्षेत्रीय परिनियोजन की योजना बनाएं

## क्षमता योजना क्यों महत्वपूर्ण है

एप्लिकेशन परिनियोजन से पहले, आपको सुनिश्चित करना होगा:
- आवश्यक संसाधनों के लिए **पर्याप्त कोटा**
- आपके लक्षित क्षेत्र में **संसाधन उपलब्धता**
- आपके सब्सक्रिप्शन प्रकार के लिए **सेवा स्तर उपलब्धता**
- अपेक्षित ट्रैफ़िक के लिए **नेटवर्क क्षमता**
- **उचित आकार निर्धारण** के माध्यम से लागत अनुकूलन

## 📊 Azure कोटा और सीमाओं को समझना

### सीमाओं के प्रकार
1. **सब्सक्रिप्शन-स्तरीय कोटा** - प्रति सब्सक्रिप्शन अधिकतम संसाधन
2. **क्षेत्रीय कोटा** - प्रति क्षेत्र अधिकतम संसाधन
3. **संसाधन-विशिष्ट सीमाएँ** - व्यक्तिगत संसाधन प्रकारों के लिए सीमाएँ
4. **सेवा स्तर सीमाएँ** - आपकी सेवा योजना के आधार पर सीमाएँ

### सामान्य संसाधन कोटा
```bash
# वर्तमान कोटा उपयोग की जांच करें
az vm list-usage --location eastus2 --output table

# विशिष्ट संसाधन कोटा की जांच करें
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## पूर्व-परिनियोजन क्षमता जांच

### स्वचालित क्षमता सत्यापन स्क्रिप्ट
```bash
#!/bin/bash
# capacity-check.sh - परिनियोजन से पहले Azure क्षमता को मान्य करें

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# कोटा उपयोग की जांच करने के लिए फ़ंक्शन
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

# विभिन्न संसाधन कोटा की जांच करें
check_quota "compute" 4      # 4 vCPUs की आवश्यकता है
check_quota "storage" 2      # 2 स्टोरेज खातों की आवश्यकता है
check_quota "network" 1      # 1 वर्चुअल नेटवर्क की आवश्यकता है

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### सेवा-विशिष्ट क्षमता जांच

#### ऐप सेवा क्षमता
```bash
# ऐप सेवा योजना की उपलब्धता जांचें
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # क्षेत्र में उपलब्ध SKU की जांच करें
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # वैकल्पिक क्षेत्रों का सुझाव दें
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # वर्तमान उपयोग की जांच करें
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# उपयोग
check_app_service_capacity "eastus2" "P1v3"
```

#### डेटाबेस क्षमता
```bash
# PostgreSQL क्षमता की जांच करें
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # जांचें कि SKU उपलब्ध है या नहीं
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # उपलब्ध SKUs दिखाएं
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB क्षमता की जांच करें
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # क्षेत्र की उपलब्धता की जांच करें
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # जांचें कि सर्वरलेस समर्थित है या नहीं (यदि आवश्यक हो)
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

#### कंटेनर ऐप्स क्षमता
```bash
# कंटेनर ऐप्स की क्षमता जांचें
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # जांचें कि कंटेनर ऐप्स क्षेत्र में उपलब्ध है या नहीं
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # वर्तमान पर्यावरण गणना जांचें
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # कंटेनर ऐप्स में प्रति क्षेत्र 15 पर्यावरण की सीमा है
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # उपलब्ध क्षेत्रों को दिखाएं
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 क्षेत्रीय उपलब्धता सत्यापन

### क्षेत्र द्वारा सेवा उपलब्धता
```bash
# क्षेत्रों में सेवा उपलब्धता की जांच करें
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

# सभी सेवाओं की जांच करें
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### क्षेत्र चयन सिफारिशें
```bash
# आवश्यकताओं के आधार पर इष्टतम क्षेत्रों की सिफारिश करें
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

## 💰 लागत योजना और अनुमान

### संसाधन लागत अनुमान
```bash
# परिनियोजन लागत का अनुमान लगाएं
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # अनुमान के लिए एक अस्थायी संसाधन समूह बनाएं
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # सत्यापन मोड में बुनियादी ढांचे को परिनियोजित करें
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # अस्थायी संसाधन समूह को साफ करें
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU अनुकूलन सिफारिशें
```bash
# आवश्यकताओं के आधार पर सर्वोत्तम SKU की सिफारिश करें
recommend_sku() {
    local service=$1
    local workload_type=$2  # "डेव" | "स्टेजिंग" | "प्रोडक्शन"
    
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

## 🚀 स्वचालित पूर्व-फ्लाइट जांच

### व्यापक पूर्व-फ्लाइट स्क्रिप्ट
```bash
#!/bin/bash
# preflight-check.sh - पूर्व परिनियोजन सत्यापन पूरा करें

set -e

# कॉन्फ़िगरेशन
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# आउटपुट के लिए रंग
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # कोई रंग नहीं

# लॉगिंग फ़ंक्शन
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# कॉन्फ़िगरेशन लोड करें
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

# जांच 1: प्रमाणीकरण
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# जांच 2: क्षेत्रीय उपलब्धता
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# जांच 3: कोटा सत्यापन
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

# स्टोरेज खाता कोटा
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

# जांच 4: सेवा उपलब्धता
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

# जांच 5: नेटवर्क क्षमता
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

# जांच 6: संसाधन नामकरण सत्यापन
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# जांच 7: लागत अनुमान
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

# जांच 8: टेम्पलेट सत्यापन
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

# अंतिम सारांश
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### कॉन्फ़िगरेशन फ़ाइल टेम्पलेट
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

## 📈 परिनियोजन के दौरान क्षमता की निगरानी

### वास्तविक समय क्षमता निगरानी
```bash
# परिनियोजन के दौरान क्षमता की निगरानी करें
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # परिनियोजन की स्थिति जांचें
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
        
        # वर्तमान संसाधन उपयोग की जांच करें
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD के साथ एकीकरण

### azure.yaml में पूर्व-फ्लाइट हुक जोड़ें
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

## सर्वोत्तम प्रथाएँ

1. **हमेशा क्षमता जांच चलाएँ** नए क्षेत्रों में परिनियोजन से पहले
2. **कोटा उपयोग की नियमित निगरानी करें** ताकि आश्चर्य से बचा जा सके
3. **विकास की योजना बनाएं** भविष्य की क्षमता आवश्यकताओं की जांच करके
4. **लागत अनुमान उपकरणों का उपयोग करें** बिल झटके से बचने के लिए
5. **अपनी टीम के लिए क्षमता आवश्यकताओं का दस्तावेज़ बनाएं**
6. **सीआई/सीडी पाइपलाइनों में क्षमता सत्यापन को स्वचालित करें**
7. **क्षेत्रीय फेलओवर** क्षमता आवश्यकताओं पर विचार करें

## अगले कदम

- [SKU चयन गाइड](sku-selection.md) - इष्टतम सेवा स्तर चुनें
- [पूर्व-फ्लाइट जांच](preflight-checks.md) - स्वचालित सत्यापन स्क्रिप्ट
- [चीट शीट](../../resources/cheat-sheet.md) - त्वरित संदर्भ कमांड
- [शब्दावली](../../resources/glossary.md) - शब्द और परिभाषाएँ

## अतिरिक्त संसाधन

- [Azure सब्सक्रिप्शन सीमाएँ](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure मूल्य निर्धारण कैलकुलेटर](https://azure.microsoft.com/pricing/calculator/)
- [Azure लागत प्रबंधन](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure क्षेत्रीय उपलब्धता](https://azure.microsoft.com/global-infrastructure/services/)

---

**नेविगेशन**
- **पिछला पाठ**: [डिबगिंग गाइड](../troubleshooting/debugging.md)

- **अगला पाठ**: [SKU चयन](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->