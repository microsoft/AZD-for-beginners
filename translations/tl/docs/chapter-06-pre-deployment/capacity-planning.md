# Capacity Planning - Azure Resource Availability and Limits

**Chapter Navigation:**
- **📚 Course Home**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Current Chapter**: Kabanata 6 - Pag-validate at Pagpaplano Bago Mag-deploy
- **⬅️ Previous Chapter**: [Kabanata 5: Mga Solusyon ng Multi-Agent AI](../../examples/retail-scenario.md)
- **➡️ Next**: [Pagpili ng SKU](sku-selection.md)
- **🚀 Next Chapter**: [Kabanata 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## Introduction

Ang komprehensibong gabay na ito ay tumutulong sa iyo na magplano at mag-validate ng kapasidad ng mga Azure resource bago mag-deploy gamit ang Azure Developer CLI. Matutunan kung paano tasahin ang mga quota, availability, at mga limitasyon ng rehiyon upang matiyak ang matagumpay na deployments habang ine-optimize ang gastos at performance. Maging bihasa sa mga teknik ng capacity planning para sa iba't ibang arkitektura ng application at mga senaryo ng scaling.

## Learning Goals

Sa pagtatapos ng gabay na ito, ikaw ay:
- Mauunawaan ang mga quota, limitasyon, at mga paghihigpit sa regional availability ng Azure
- Maging bihasa sa mga teknik para suriin ang availability at kapasidad ng resource bago mag-deploy
- Magpatupad ng automated na validation at monitoring ng kapasidad
- Magdisenyo ng mga application na may tamang sizing at mga konsiderasyon sa scaling
- Mag-apply ng mga estratehiya sa pag-optimize ng gastos sa pamamagitan ng intelihenteng capacity planning
- Mag-configure ng mga alert at monitoring para sa paggamit ng quota at availability ng resource

## Learning Outcomes

Pagkatapos makumpleto, magagawa mong:
- Tasahin at i-validate ang mga kinakailangan sa kapasidad ng Azure resource bago mag-deploy
- Gumawa ng mga automated script para sa pag-check ng kapasidad at pag-monitor ng quota
- Magdisenyo ng scalable na mga arkitektura na isinasaalang-alang ang mga limitasyon ng rehiyon at subscription
- Magpatupad ng cost-effective na mga estratehiya sa sizing ng resource para sa iba't ibang uri ng workload
- Mag-configure ng proaktibong monitoring at alerting para sa mga isyu na may kaugnayan sa kapasidad
- Magplano ng multi-region deployments na may tamang distribusyon ng kapasidad

## Why Capacity Planning Matters

Bago mag-deploy ng mga application, kailangan mong tiyakin:
- **Sapat na quota** para sa mga kinakailangang resource
- **Availability ng resource** sa target mong rehiyon
- **Availability ng service tier** para sa uri ng iyong subscription
- **Network capacity** para sa inaasahang traffic
- **Pag-optimize ng gastos** sa pamamagitan ng tamang sizing

## 📊 Understanding Azure Quotas and Limits

### Types of Limits
1. **Subscription-level quotas** - Maximum na mga resource kada subscription
2. **Regional quotas** - Maximum na mga resource kada rehiyon
3. **Resource-specific limits** - Mga limitasyon para sa indibidwal na uri ng resource
4. **Service tier limits** - Mga limitasyon batay sa iyong service plan

### Common Resource Quotas
```bash
# Suriin ang kasalukuyang paggamit ng quota
az vm list-usage --location eastus2 --output table

# Suriin ang mga partikular na quota para sa mga mapagkukunan
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Pre-Deployment Capacity Checks

### Automated Capacity Validation Script
```bash
#!/bin/bash
# capacity-check.sh - Suriin ang kapasidad ng Azure bago mag-deploy

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Punsyon para suriin ang paggamit ng quota
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

# Suriin ang iba't ibang quota ng mga resource
check_quota "compute" 4      # Kailangan ng 4 na vCPU
check_quota "storage" 2      # Kailangan ng 2 na storage account
check_quota "network" 1      # Kailangan ng 1 na virtual network

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Service-Specific Capacity Checks

#### App Service Capacity
```bash
# Suriin ang pagkakaroon ng App Service Plan
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Suriin ang mga magagamit na SKU sa rehiyon
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Magmungkahi ng mga alternatibong rehiyon
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Suriin ang kasalukuyang paggamit
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Paggamit
check_app_service_capacity "eastus2" "P1v3"
```

#### Database Capacity
```bash
# Suriin ang kapasidad ng PostgreSQL
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Suriin kung magagamit ang SKU
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Ipakita ang mga magagamit na SKU
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Suriin ang kapasidad ng Cosmos DB
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Suriin kung magagamit ang rehiyon
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Suriin kung sinusuportahan ang serverless (kung kinakailangan)
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

#### Container Apps Capacity
```bash
# Suriin ang kapasidad ng Container Apps
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Suriin kung magagamit ang Container Apps sa rehiyon
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Suriin ang kasalukuyang bilang ng mga environment
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # May limit ang Container Apps na 15 environment kada rehiyon
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Ipakita ang mga magagamit na rehiyon
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Regional Availability Validation

### Service Availability by Region
```bash
# Suriin ang pagkakaroon ng serbisyo sa iba't ibang rehiyon
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

# Suriin ang lahat ng serbisyo
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Region Selection Recommendations
```bash
# Iminumungkahi ang pinakamainam na mga rehiyon batay sa mga kinakailangan
recommend_region() {
    local requirements=$1  # "mababang-gastos" | "pagganap" | "pagsunod"
    
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

## 💰 Cost Planning and Estimation

### Resource Cost Estimation
```bash
# Tantiyahin ang mga gastos sa pag-deploy
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Gumawa ng pansamantalang resource group para sa pagtatantya
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # I-deploy ang imprastruktura sa validation mode
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Linisin ang pansamantalang resource group
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU Optimization Recommendations
```bash
# Iminumungkahi ang pinakamainam na SKU batay sa mga kinakailangan
recommend_sku() {
    local service=$1
    local workload_type=$2  # "pagpapaunlad" | "pagsusuri" | "produksyon"
    
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

## 🚀 Automated Pre-Flight Checks

### Comprehensive Pre-Flight Script
```bash
#!/bin/bash
# preflight-check.sh - Kumpletong pagpapatunay bago ang pag-deploy

set -e

# Konfigurasyon
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Mga kulay para sa output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Walang kulay

# Mga function ng pag-log
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# I-load ang konfigurasyon
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

# Pagsusuri 1: Autentikasyon
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Pagsusuri 2: Pagkakaroon sa rehiyon
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Pagsusuri 3: Pagpapatunay ng quota
log_info "Checking quota availability..."

# Quota ng vCPU
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

# Quota ng storage account
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

# Pagsusuri 4: Pagiging magagamit ng serbisyo
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

# Pagsusuri 5: Kapasidad ng network
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

# Pagsusuri 6: Pagpapatunay ng pangalan ng resource
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Pagsusuri 7: Pagtatantiya ng gastos
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

# Pagsusuri 8: Pagpapatunay ng template
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

# Pangwakas na buod
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Configuration File Template
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

## 📈 Monitoring Capacity During Deployment

### Real-Time Capacity Monitoring
```bash
# Subaybayan ang kapasidad habang nagde-deploy
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Suriin ang katayuan ng deployment
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
        
        # Suriin ang kasalukuyang paggamit ng mga mapagkukunan
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 Integration with AZD

### Add Pre-Flight Hooks to azure.yaml
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

## Best Practices

1. **Laging patakbuhin ang mga capacity check** bago mag-deploy sa mga bagong rehiyon
2. **Regular na i-monitor ang paggamit ng quota** upang maiwasan ang mga hindi inaasahang sitwasyon
3. **Magplano para sa paglago** sa pamamagitan ng pag-check ng mga kinakailangan sa kapasidad sa hinaharap
4. **Gumamit ng mga tool sa pagtatantiya ng gastos** upang maiwasan ang mataas na bill
5. **Idokumento ang mga kinakailangan sa kapasidad** para sa iyong team
6. **I-automate ang validation ng kapasidad** sa CI/CD pipelines
7. **Isaalang-alang ang mga pangangailangan sa regional failover** ng kapasidad

## Next Steps

- [Gabayan sa Pagpili ng SKU](sku-selection.md) - Pumili ng optimal na mga service tier
- [Pre-flight Checks](preflight-checks.md) - Mga automated validation script
- [Cheat Sheet](../../resources/cheat-sheet.md) - Quick reference na mga command
- [Glossary](../../resources/glossary.md) - Mga termino at depinisyon

## Additional Resources

- [Mga Limitasyon sa Subscription ng Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Kalkulador ng Presyo ng Azure](https://azure.microsoft.com/pricing/calculator/)
- [Pamamahala ng Gastos sa Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Rehiyonal na Availability ng Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigation**
- **Previous Lesson**: [Gabay sa Pag-debug](../chapter-07-troubleshooting/debugging.md)

- **Next Lesson**: [Pagpili ng SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang AI na serbisyo sa pagsasalin [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi katumpakan. Ang orihinal na dokumento sa orihing wika nito ang dapat ituring na pinagkakatiwalaang sanggunian. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling ginawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaintindihan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->