<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5d681f3e20256d547ab3eebc052c1b6d",
  "translation_date": "2025-10-13T15:28:04+00:00",
  "source_file": "docs/pre-deployment/capacity-planning.md",
  "language_code": "mr"
}
-->
# क्षमता नियोजन: Azure कोटा आणि मर्यादा समजून घेणे - Azure संसाधन उपलब्धता आणि मर्यादा

## परिचय

ही सविस्तर मार्गदर्शिका तुम्हाला Azure Developer CLI वापरण्यापूर्वी Azure संसाधन क्षमता नियोजन आणि पडताळणी करण्यास मदत करते. यामध्ये कोटा, उपलब्धता आणि प्रादेशिक मर्यादा कशा तपासायच्या हे शिकून यशस्वी डिप्लॉयमेंटसाठी तयारी करा, तसेच खर्च आणि कार्यक्षमता सुधारण्यासाठी नियोजन करा. विविध अनुप्रयोग आर्किटेक्चर आणि स्केलिंग परिस्थितीसाठी क्षमता नियोजन तंत्रज्ञानात प्रावीण्य मिळवा.

## शिकण्याची उद्दिष्टे

ही मार्गदर्शिका पूर्ण केल्यानंतर तुम्ही:
- Azure कोटा, मर्यादा आणि प्रादेशिक उपलब्धता मर्यादा समजून घ्याल
- डिप्लॉयमेंटपूर्वी संसाधन उपलब्धता आणि क्षमता तपासण्याचे तंत्रज्ञान आत्मसात कराल
- स्वयंचलित क्षमता पडताळणी आणि निरीक्षण धोरणे अंमलात आणाल
- योग्य संसाधन आकार आणि स्केलिंग विचारांसह अनुप्रयोग डिझाइन कराल
- हुशार क्षमता नियोजनाद्वारे खर्च कमी करण्याच्या रणनीती लागू कराल
- कोटा वापर आणि संसाधन उपलब्धतेसाठी अलर्ट आणि निरीक्षण कॉन्फिगर कराल

## शिकण्याचे परिणाम

पूर्ण झाल्यावर तुम्ही:
- डिप्लॉयमेंटपूर्वी Azure संसाधन क्षमता आवश्यकता तपासू आणि पडताळू शकाल
- क्षमता तपासणी आणि कोटा निरीक्षणासाठी स्वयंचलित स्क्रिप्ट तयार करू शकाल
- प्रादेशिक आणि सबस्क्रिप्शन मर्यादांचा विचार करून स्केलेबल आर्किटेक्चर डिझाइन करू शकाल
- विविध वर्कलोड प्रकारांसाठी खर्च-प्रभावी संसाधन आकार रणनीती अंमलात आणू शकाल
- क्षमता-संबंधित समस्यांसाठी सक्रिय निरीक्षण आणि अलर्टिंग कॉन्फिगर करू शकाल
- योग्य क्षमता वितरणासह बहु-प्रदेशीय डिप्लॉयमेंटचे नियोजन करू शकाल

## क्षमता नियोजन का महत्त्वाचे आहे

अनुप्रयोग डिप्लॉय करण्यापूर्वी तुम्हाला खात्री करावी लागते:
- **पुरेसे कोटा** आवश्यक संसाधनांसाठी
- **संसाधन उपलब्धता** तुमच्या लक्ष्यित प्रदेशात
- **सेवा स्तर उपलब्धता** तुमच्या सबस्क्रिप्शन प्रकारासाठी
- **नेटवर्क क्षमता** अपेक्षित ट्रॅफिकसाठी
- **खर्च अनुकूलन** योग्य आकाराच्या माध्यमातून

## 📊 Azure कोटा आणि मर्यादा समजून घेणे

### मर्यादांचे प्रकार
1. **सबस्क्रिप्शन-स्तरीय कोटा** - प्रत्येक सबस्क्रिप्शनसाठी जास्तीत जास्त संसाधने
2. **प्रादेशिक कोटा** - प्रत्येक प्रदेशासाठी जास्तीत जास्त संसाधने
3. **संसाधन-विशिष्ट मर्यादा** - वैयक्तिक संसाधन प्रकारांसाठी मर्यादा
4. **सेवा स्तर मर्यादा** - तुमच्या सेवा योजनेवर आधारित मर्यादा

### सामान्य संसाधन कोटा
```bash
# Check current quota usage
az vm list-usage --location eastus2 --output table

# Check specific resource quotas
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## डिप्लॉयमेंटपूर्वी क्षमता तपासणी

### स्वयंचलित क्षमता पडताळणी स्क्रिप्ट
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

### सेवा-विशिष्ट क्षमता तपासणी

#### अ‍ॅप सेवा क्षमता
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

#### डेटाबेस क्षमता
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

#### कंटेनर अ‍ॅप्स क्षमता
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

## 📍 प्रादेशिक उपलब्धता पडताळणी

### प्रदेशानुसार सेवा उपलब्धता
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

### प्रदेश निवडीसाठी शिफारसी
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

## 💰 खर्च नियोजन आणि अंदाज

### संसाधन खर्च अंदाज
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

### SKU अनुकूलन शिफारसी
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

## 🚀 स्वयंचलित प्री-फ्लाइट तपासणी

### सर्वसमावेशक प्री-फ्लाइट स्क्रिप्ट
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

## 📈 डिप्लॉयमेंट दरम्यान क्षमता निरीक्षण

### रिअल-टाइम क्षमता निरीक्षण
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

## 🔗 AZD सह एकत्रीकरण

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

1. **नेहमी क्षमता तपासणी करा** नवीन प्रदेशात डिप्लॉय करण्यापूर्वी
2. **कोटा वापर नियमितपणे निरीक्षण करा** अनपेक्षित समस्यांपासून बचाव करण्यासाठी
3. **वाढीचे नियोजन करा** भविष्यातील क्षमता गरजा तपासून
4. **खर्च अंदाज साधने वापरा** अनपेक्षित बिल टाळण्यासाठी
5. **तुमच्या टीमसाठी क्षमता आवश्यकता दस्तऐवजीकरण करा**
6. **CI/CD पाइपलाइनमध्ये क्षमता पडताळणी स्वयंचलित करा**
7. **प्रादेशिक फेलओव्हर** क्षमता गरजांचा विचार करा

## पुढील पायऱ्या

- [SKU निवड मार्गदर्शिका](sku-selection.md) - सर्वोत्तम सेवा स्तर निवडा
- [प्री-फ्लाइट तपासणी](preflight-checks.md) - स्वयंचलित पडताळणी स्क्रिप्ट
- [चीट शीट](../../resources/cheat-sheet.md) - जलद संदर्भ आदेश
- [शब्दकोश](../../resources/glossary.md) - संज्ञा आणि परिभाषा

## अतिरिक्त संसाधने

- [Azure सबस्क्रिप्शन मर्यादा](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure किंमत कॅल्क्युलेटर](https://azure.microsoft.com/pricing/calculator/)
- [Azure खर्च व्यवस्थापन](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure प्रादेशिक उपलब्धता](https://azure.microsoft.com/global-infrastructure/services/)

---

**नेव्हिगेशन**
- **मागील धडा**: [डिबगिंग मार्गदर्शिका](../troubleshooting/debugging.md)

- **पुढील धडा**: [SKU निवड](sku-selection.md)

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरे त्रुटी किंवा अचूकतेच्या अभावाने युक्त असू शकतात. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.