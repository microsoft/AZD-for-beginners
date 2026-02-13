# क्षमता नियोजन - Azure संसाधन उपलब्धता आणि मर्यादा

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 सध्याचा अध्याय**: अध्याय 6 - पूर्व-डिप्लॉयमेंट पडताळणी आणि नियोजन
- **⬅️ मागील अध्याय**: [अध्याय 5: मल्टी-एजंट AI उपाय](../../examples/retail-scenario.md)
- **➡️ पुढील**: [SKU निवड](sku-selection.md)
- **🚀 पुढील अध्याय**: [अध्याय 7: समस्या निवारण](../chapter-07-troubleshooting/common-issues.md)

## परिचय

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI वापरून तैनाती करण्याआधी Azure संसाधन क्षमतेचे नियोजन आणि पडताळणी करण्यात मदत करतो. कोटा, उपलब्धता आणि प्रादेशिक मर्यादा मूल्यांकन करण्याचे शिका जेणेकरून तैनाती यशस्वी होईल तसेच खर्च आणि कार्यक्षमता अनुकूल करता येईल. विविध ऍप्लिकेशन आर्किटेक्चर आणि स्केलिंग परिस्थितीसाठी क्षमता नियोजन तंत्रे आत्मसात करा.

## शिकण्याची उद्दिष्टे

या मार्गदर्शकाचे पूर्णकरण केल्यानंतर, आपण:
- Azure कोटा, मर्यादा आणि प्रादेशिक उपलब्धतेच्या अटी समजून घ्याल
- तैनातीपूर्वी संसाधन उपलब्धता आणि क्षमता तपासण्याच्या तंत्रात पारंगत व्हाल
- स्वयंचलित क्षमता पडताळणी आणि निरीक्षण धोरणे अमलात आणाल
- योग्य संसाधन आकार आणि स्केलिंग विचार करून ऍप्लिकेशन्स डिझाइन कराल
- बुद्धिमान क्षमता नियोजनाद्वारे खर्च ऑप्टिमायझेशन वापराल
- कोटा वापर आणि संसाधन उपलब्धतेसाठी अलर्ट आणि मॉनिटरिंग कॉन्फिगर कराल

## शिकण्याचे परिणाम

पूर्ण केल्यावर, आपण सक्षम असाल:
- तैनातीपूर्वी Azure संसाधन क्षमतेच्या आवश्यकतांचे मूल्यांकन आणि पडताळणी करणे
- क्षमता तपासणी आणि कोटा मॉनिटरिंगसाठी स्वयंचलित स्क्रिप्ट तयार करणे
- प्रादेशिक आणि सदस्यता मर्यादा लक्षात घेऊन स्केलेबल आर्किटेक्चर डिझाइन करणे
- विविध वर्कलोड प्रकारांसाठी खर्च-कार्यक्षम संसाधन आकारणी धोरणे अमलात आणणे
- क्षमता-संबंधित समस्यांसाठी प्रोकॅटिव मॉनिटरिंग आणि अलर्टिंग कॉन्फिगर करणे
- योग्य क्षमता वितरणासह बहु-प्रदेश तैनातीची योजना करणे

## क्षमता नियोजन का महत्त्वाचे आहे

अॅप्लिकेशन्स तैनात करण्यापूर्वी, आपल्याला खात्री करणे आवश्यक आहे:
- आवश्यक संसाधनांसाठी **पुरेसे कोटा**
- लक्षित प्रदेशात **संसाधन उपलब्धता**
- आपल्या सदस्यता प्रकारासाठी **सेवा स्तर उपलब्धता**
- अपेक्षित ट्रॅफिकसाठी **नेटवर्क क्षमता**
- योग्य आकारणीद्वारे **खर्च अनुकूलन**

## 📊 Azure कोटा आणि मर्यादा समजून घेणे

### मर्यादांचे प्रकार
1. **सदस्यता-स्तरीय कोटा** - सदस्यतेप्रमाणे कमाल संसाधने
2. **प्रादेशिक कोटा** - प्रत्येक प्रदेशासाठी कमाल संसाधने
3. **संसाधन-विशिष्ट मर्यादा** - वैयक्तिक संसाधन प्रकारांसाठी मर्यादा
4. **सेवा स्तर मर्यादा** - आपल्या सेवा योजनानुसार मर्यादा

### सामान्य संसाधन कोटा
```bash
# सध्याचा कोटा वापर तपासा
az vm list-usage --location eastus2 --output table

# विशिष्ट संसाधनांचे कोटे तपासा
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## पूर्व-डिप्लॉयमेंट क्षमता तपासण्या

### स्वयंचलित क्षमता पडताळणी स्क्रिप्ट
```bash
#!/bin/bash
# capacity-check.sh - तैनात करण्यापूर्वी Azure ची क्षमता सत्यापित करा

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# क्वोटा वापर तपासण्याचे कार्य
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

# विविध संसाधनांच्या कोटा तपासा
check_quota "compute" 4      # 4 vCPU आवश्यक आहेत
check_quota "storage" 2      # 2 स्टोरेज खाते आवश्यक आहेत
check_quota "network" 1      # 1 वर्च्युअल नेटवर्क आवश्यक आहे

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### सेवा-विशिष्ट क्षमता तपासण्या

#### ऍप सेवा क्षमता
```bash
# App Service Plan उपलब्धता तपासा
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # प्रदेशातील उपलब्ध SKUs तपासा
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # पर्यायी प्रदेश सुचवा
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # सध्याचा वापर तपासा
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# वापर
check_app_service_capacity "eastus2" "P1v3"
```

#### डेटाबेस क्षमता
```bash
# PostgreSQL क्षमता तपासा
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # SKU उपलब्ध आहे का ते तपासा
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # उपलब्ध SKU दाखवा
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB क्षमता तपासा
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # प्रदेश उपलब्ध आहे का ते तपासा
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # सर्व्हरलेस समर्थित आहे का ते तपासा (गरज असल्यास)
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

#### कंटेनर ऍप्स क्षमता
```bash
# Container Apps ची क्षमता तपासा
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Container Apps दिलेल्या प्रदेशात उपलब्ध आहे का ते तपासा
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # सध्याच्या एन्व्हायर्नमेंटची संख्या तपासा
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps साठी प्रत्येक प्रदेशात 15 एन्व्हायर्नमेंट्सची मर्यादा आहे
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # उपलब्ध प्रदेश दाखवा
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 प्रादेशिक उपलब्धता पडताळणी

### प्रदेशानुसार सेवा उपलब्धता
```bash
# विविध प्रदेशांमध्ये सेवांची उपलब्धता तपासा
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

# सर्व सेवा तपासा
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### प्रदेश निवड शिफारसी
```bash
# गरजांनुसार सर्वोत्तम प्रदेश शिफारस करा
recommend_region() {
    local requirements=$1  # "कमी खर्च" | "प्रदर्शन" | "अनुपालन"
    
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

## 💰 खर्च नियोजन आणि अंदाज

### संसाधन खर्च अंदाज
```bash
# तैनातीचा खर्च अंदाज करा
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # अंदाजासाठी तात्पुरता रिसोर्स ग्रुप तयार करा
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # पुष्टीकरण मोडमध्ये पायाभूत सुविधा तैनात करा
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # तात्पुरता रिसोर्स ग्रुप काढून टाका
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU ऑप्टिमायझेशन शिफारसी
```bash
# आवश्यकतांनुसार सर्वोत्तम SKU शिफारस करा
recommend_sku() {
    local service=$1
    local workload_type=$2  # "विकास" | "पूर्व-उत्पादन" | "उत्पादन"
    
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

## 🚀 स्वयंचलित प्री-फ्लाइट तपासण्या

### समग्र प्री-फ्लाइट स्क्रिप्ट
```bash
#!/bin/bash
# preflight-check.sh - प्री-डिप्लॉयमेंटसाठी पूर्ण पडताळणी

set -e

# कॉन्फिगरेशन
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# आउटपुटसाठी रंग
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # रंग नाही

# लॉगिंग फंक्शन्स
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# कॉन्फिगरेशन लोड करा
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

# तपास 1: प्रमाणीकरण
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# तपास 2: क्षेत्रीय उपलब्धता
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# तपास 3: कोटा पडताळणी
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

# स्टोरेज खाते कोटा
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

# तपास 4: सेवा उपलब्धता
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

# तपास 5: नेटवर्क क्षमता
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

# तपास 6: संसाधन नावांची पडताळणी
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# तपास 7: खर्चाचा अंदाज
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

# तपास 8: टेम्पलेट पडताळणी
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

### कॉन्फिगरेशन फाइल टेम्पलेट
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

## 📈 तैनाती दरम्यान क्षमता निरीक्षण

### रिअल-टाइम क्षमता मॉनिटरिंग
```bash
# डिप्लॉयमेंट दरम्यान क्षमतेचे निरीक्षण करा
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # डिप्लॉयमेंटची स्थिती तपासा
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
        
        # सध्याच्या संसाधनांच्या वापराची तपासणी करा
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD सह समाकलन

### azure.yaml मध्ये प्री-फ्लाइट हुक्स जोडा
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

## सर्वोत्तम पद्धती

1. **नवीन प्रदेशात तैनात करण्यापूर्वी नेहमी क्षमता तपासण्या चालवा**
2. **आश्चर्य टाळण्यासाठी** कोटा वापर नियमितपणे मॉनिटर करा
3. **वाढीसाठी नियोजन करा** — भविष्यातील क्षमतेच्या गरजा तपासा
4. **बिल-शॉक टाळण्यासाठी खर्च अंदाज साधने वापरा**
5. **आपल्या टीमसाठी क्षमता आवश्यकता दस्तावेज करा**
6. **CI/CD पाइपलाइन्समध्ये क्षमता पडताळणी स्वयंचलित करा**
7. **प्रादेशिक फेलओव्हर क्षमतेच्या आवश्यकता विचारात घ्या**

## पुढील पायऱ्या

- [SKU Selection Guide](sku-selection.md) - सर्वोत्तम सेवा टियर निवडा
- [Pre-flight Checks](preflight-checks.md) - स्वयंचलित पडताळणी स्क्रिप्ट्स
- [Cheat Sheet](../../resources/cheat-sheet.md) - त्वरित संदर्भ कमांड्स
- [Glossary](../../resources/glossary.md) - शब्द आणि व्याख्या

## अतिरिक्त संसाधने

- [Azure Subscription Limits](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Cost Management](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure Regional Availability](https://azure.microsoft.com/global-infrastructure/services/)

---

**नेव्हिगेशन**
- **मागील धडा**: [Debugging Guide](../chapter-07-troubleshooting/debugging.md)

- **पुढील धडा**: [SKU निवड](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हा दस्तऐवज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) वापरून अनुवादित केला गेला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादात चुका किंवा अचूकतेच्या त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थनिष्कर्षांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->