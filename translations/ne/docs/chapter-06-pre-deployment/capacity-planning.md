# क्षमता योजना - Azure स्रोत उपलब्धता र सीमा

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम गृह**: [AZD प्रारम्भकर्ताहरूका लागि](../../README.md)
- **📖 हालको अध्याय**: अध्याय 6 - पूर्व-तैनाती प्रमाणीकरण र योजना
- **⬅️ अघिल्लो अध्याय**: [अध्याय 5: बहु-एजेन्ट AI समाधानहरू](../../examples/retail-scenario.md)
- **➡️ अर्को**: [SKU चयन](sku-selection.md)
- **🚀 अर्को अध्याय**: [अध्याय 7: समस्या समाधान](../chapter-07-troubleshooting/common-issues.md)

## परिचय

यो व्यापक मार्गदर्शनले तपाईंलाई Azure Developer CLI सँग तैनाती गर्नु अघि Azure स्रोत क्षमता योजना र प्रमाणीकरण गर्न मद्दत गर्दछ। कोटा, उपलब्धता, र क्षेत्रीय सीमाहरू मूल्याङ्कन गर्न सिक्नुहोस् ताकि सफल तैनाती सुनिश्चित गरियोस् र लागत तथा प्रदर्शन अनुकूलन होस्। विभिन्न अनुप्रयोग आर्किटेक्चर र स्केलिङ परिदृश्यहरूका लागि क्षमता योजना प्रविधिहरूमा निपुण बन्नुहोस्।

## सिक्ने लक्ष्यहरू

यस मार्गदर्शन पूरा गरेर, तपाईंले:
- Azure कोटा, सीमाहरू, र क्षेत्रीय उपलब्धता प्रतिबन्धहरू बुझ्न सक्नुहुनेछ
- तैनाती अघि स्रोत उपलब्धता र क्षमताको जाँच गर्ने प्रविधिहरूमा निपुण हुन सक्नुहुनेछ
- स्वचालित क्षमता प्रमाणीकरण र अनुगमन रणनीतिहरू लागू गर्न सक्नुहुनेछ
- उपयुक्त स्रोत साइजिङ र स्केलिङ विचारहरू सहित आवेदनहरू डिजाइन गर्न सक्नुहुनेछ
- बुद्धिमानीपूर्ण क्षमता योजनाका माध्यमबाट लागत अनुकूलन रणनीतिहरू लागू गर्न सक्नुहुनेछ
- कोटा प्रयोग र स्रोत उपलब्धताका लागि अलर्ट र अनुगमन कन्फिगर गर्न सक्नुहुनेछ

## सिकाइ नतिजाहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- तैनाती गर्नु अघि Azure स्रोत क्षमताका आवश्यकता मूल्याङ्कन र प्रमाणीकरण गर्न
- क्षमता जाँच र कोटा अनुगमनका लागि स्वचालित स्क्रिप्टहरू सिर्जना गर्न
- क्षेत्रीय र सदस्यता सीमाहरूलाई ध्यानमा राख्दै स्केलेबल आर्किटेक्चरहरू डिजाइन गर्न
- विभिन्न वर्कलोड प्रकारहरूको लागि लागत-प्रभावकारी स्रोत साइजिङ रणनीतिहरू लागू गर्न
- क्षमता सम्बन्धी समस्याहरूको लागि सक्रिय अनुगमन र अलर्टिङ कन्फिगर गर्न
- उपयुक्त क्षमता वितरणसहित बहु-क्षेत्रीय तैनाती योजना बनाउन

## क्षमता योजना किन महत्वपूर्ण छ

एप्लिकेसनहरू तैनाथ गर्नु अगाडि, तपाईंले सुनिश्चित गर्न आवश्यक छ:
- **पर्याप्त कोटा** आवश्यक स्रोतहरूको लागि
- **स्रोत उपलब्धता** तपाईंको लक्षित क्षेत्रमा
- **सेवा स्तर उपलब्धता** तपाईंको सदस्यता प्रकारका लागि
- **नेटवर्क क्षमता** अपेक्षित ट्राफिकका लागि
- **लागत अनुकूलन** उचित साइजिङ मार्फत

## 📊 Azure कोटा र सीमाहरू बुझ्नुहोस्

### सीमाका प्रकारहरू
1. **सदस्यता-स्तर कोटा** - सदस्यतामा अधिकतम स्रोतहरू
2. **क्षेत्रीय कोटा** - प्रत्येक क्षेत्रमा अधिकतम स्रोतहरू
3. **स्रोत-विशिष्ट सीमाहरू** - व्यक्तिगत स्रोत प्रकारहरूको लागि सीमाहरू
4. **सेवा स्तर सीमाहरू** - तपाईंको सेवा योजनामा आधारित सीमाहरू

### सामान्य स्रोत कोटा
```bash
# हालको कोटा प्रयोग जाँच्नुहोस्
az vm list-usage --location eastus2 --output table

# विशिष्ट स्रोत कोटाहरू जाँच्नुहोस्
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## पूर्व-तैनाती क्षमता जाँचहरू

### स्वचालित क्षमता प्रमाणीकरण स्क्रिप्ट
```bash
#!/bin/bash
# capacity-check.sh - परिनियोजन अघि Azure क्षमता प्रमाणित गर्नुहोस्

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# क्वोटा प्रयोग जाँच्ने कार्य
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

# विभिन्न संसाधन कोटा जाँच गर्नुहोस्
check_quota "compute" 4      # 4 vCPUs आवश्यक छन्
check_quota "storage" 2      # 2 स्टोरेज खाताहरू आवश्यक छन्
check_quota "network" 1      # 1 भर्चुअल नेटवर्क आवश्यक छ

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### सेवा-विशिष्ट क्षमता जाँचहरू

#### App Service क्षमता
```bash
# एप सेवा योजना उपलब्धता जाँच गर्नुहोस्
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # क्षेत्रमा उपलब्ध SKUहरू जाँच गर्नुहोस्
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
    
    # हालको प्रयोग जाँच गर्नुहोस्
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# प्रयोग
check_app_service_capacity "eastus2" "P1v3"
```

#### डेटाबेस क्षमता
```bash
# PostgreSQL क्षमताको जाँच गर्नुहोस्
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
        
        # उपलब्ध SKUहरू देखाउनुहोस्
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB क्षमताको जाँच गर्नुहोस्
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # क्षेत्र उपलब्धता जाँच गर्नुहोस्
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # सर्भरलेस समर्थन छ कि छैन जाँच गर्नुहोस् (आवश्यक भएमा)
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

#### Container Apps क्षमता
```bash
# Container Apps को क्षमता जाँच गर्नुहोस्
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Container Apps उक्त क्षेत्रमा उपलब्ध छ कि छैन जाँच गर्नुहोस्
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # वर्तमान वातावरणहरूको संख्या जाँच गर्नुहोस्
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps प्रति क्षेत्रमा अधिकतम 15 वटा वातावरणको सीमा छ
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

## 📍 क्षेत्रीय उपलब्धता प्रमाणीकरण

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

### क्षेत्र छनौट सिफारिसहरू
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
# परिनियोजन लागत अनुमान गर्नुहोस्
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # अनुमानका लागि अस्थायी स्रोत समूह सिर्जना गर्नुहोस्
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # मान्यकरण मोडमा पूर्वाधार परिनियोजन गर्नुहोस्
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # अस्थायी स्रोत समूह मेटाउनुहोस्
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
    local workload_type=$2  # "विकास" | "स्टेजिङ" | "उत्पादन"
    
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

## 🚀 स्वचालित पूर्व-तैनाती जाँचहरू

### व्यापक पूर्व-तैनाती स्क्रिप्ट
```bash
#!/bin/bash
# preflight-check.sh - परिनियोजन अघि पूर्ण मान्यकरण

set -e

# विन्यास
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# आउटपुटका लागि रंगहरू
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # रङ छैन

# लगिङ कार्यहरू
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# विन्यास लोड गर्नुहोस्
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

# जाँच 6: संसाधन नामकरण मान्यकरण
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

# जाँच 8: टेम्पलेट मान्यकरण
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

### कन्फिगरेसन फाइल ढाँचा
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

## 📈 तैनातीको दौरान क्षमता अनुगमन

### रियल-टाइ्म क्षमता अनुगमन
```bash
# परिनियोजनको क्रममा क्षमताको अनुगमन गर्नुहोस्
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # परिनियोजनको स्थिति जाँच गर्नुहोस्
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
        
        # हालको स्रोत प्रयोग जाँच गर्नुहोस्
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD सँग एकीकरण

### azure.yaml मा पूर्व-तैनाती हुकहरू थप्नुहोस्
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

## सर्वोत्तम अभ्यासहरू

1. **सधैं क्षमता जाँचहरू चलाउनुहोस्** नयाँ क्षेत्रमा तैनाती गर्नु अघि
2. **कोटा प्रयोग नियमित रूपमा अनुगमन गर्नुहोस्** ताकि अप्रत्याशित समस्याहरू नआउन्
3. **विकासका लागि योजना बनाउनुहोस्** भविश्यका क्षमता आवश्यकताहरू जाँच गरेर
4. **लागत अनुमान उपकरणहरू प्रयोग गर्नुहोस्** बिल शकबाट बच्न
5. **टीमका लागि क्षमता आवश्यकता दस्तावेजिकरण गर्नुहोस्**
6. **CI/CD पाइपलाइनमा क्षमता प्रमाणीकरण स्वचालित गर्नुहोस्**
7. **क्षेत्रीय फेलओभरका लागि** क्षमता आवश्यकताहरू विचार गर्नुहोस्

## अर्को कदमहरू

- [SKU चयन मार्गदर्शक](sku-selection.md) - अनुकूल सेवा स्तरहरू छान्नुहोस्
- [पूर्व-तैनाती जाँचहरू](preflight-checks.md) - स्वचालित प्रमाणीकरण स्क्रिप्टहरू
- [छिटो सन्दर्भ](../../resources/cheat-sheet.md) - छोटो सन्दर्भ आदेशहरू
- [शब्दावली](../../resources/glossary.md) - शब्द र परिभाषाहरू

## अतिरिक्त स्रोतहरू

- [Azure सदस्यता सीमाहरू](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure मूल्य निर्धारण क्यालकुलेटर](https://azure.microsoft.com/pricing/calculator/)
- [Azure लागत व्यवस्थापन](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure क्षेत्रीय उपलब्धता](https://azure.microsoft.com/global-infrastructure/services/)

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [डिबगिङ मार्गदर्शक](../chapter-07-troubleshooting/debugging.md)

- **अर्को पाठ**: [SKU चयन](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी सटीकताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा गलतताहरू हुन सक्छन्। मूल दस्तावेज यसको मूल भाषामा नै प्रामाणिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट हुने कुनै पनि गलत बुझाइ वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->