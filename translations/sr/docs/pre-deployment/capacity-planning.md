<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ce6b3aaf78f839cfdda9853c6cebffa5",
  "translation_date": "2025-09-10T06:45:28+00:00",
  "source_file": "docs/pre-deployment/capacity-planning.md",
  "language_code": "sr"
}
-->
# Планирање капацитета - Доступност и ограничења Azure ресурса

## Увод

Овај свеобухватни водич помаже вам да планирате и проверите капацитет Azure ресурса пре него што их примените помоћу Azure Developer CLI. Научите како да процените квоте, доступност и регионална ограничења како бисте осигурали успешне примене уз оптимизацију трошкова и перформанси. Савладајте технике планирања капацитета за различите архитектуре апликација и сценарије скалирања.

## Циљеви учења

Завршетком овог водича, научићете:
- Да разумете Azure квоте, ограничења и регионалне ограничености
- Да савладате технике провере доступности и капацитета ресурса пре примене
- Да имплементирате стратегије за аутоматску проверу капацитета и праћење
- Да дизајнирате апликације са правилним димензионисањем ресурса и скалирањем
- Да примените стратегије оптимизације трошкова кроз интелигентно планирање капацитета
- Да конфигуришете упозорења и праћење употребе квота и доступности ресурса

## Резултати учења

По завршетку, бићете у могућности да:
- Процените и проверите захтеве за капацитет Azure ресурса пре примене
- Креирате аутоматизоване скрипте за проверу капацитета и праћење квота
- Дизајнирате скалабилне архитектуре које узимају у обзир регионална и претплатничка ограничења
- Имплементирате економичне стратегије димензионисања ресурса за различите типове радних оптерећења
- Конфигуришете проактивно праћење и упозорења за проблеме везане за капацитет
- Планирате примене у више региона са правилном расподелом капацитета

## Зашто је планирање капацитета важно

Пре примене апликација, потребно је да осигурате:
- **Довољне квоте** за потребне ресурсе
- **Доступност ресурса** у циљаном региону
- **Доступност нивоа услуге** за ваш тип претплате
- **Мрежни капацитет** за очекивани саобраћај
- **Оптимизацију трошкова** кроз правилно димензионисање

## 📊 Разумевање Azure квота и ограничења

### Типови ограничења
1. **Квоте на нивоу претплате** - Максимални ресурси по претплати
2. **Регионалне квоте** - Максимални ресурси по региону
3. **Ограничења специфична за ресурсе** - Ограничења за појединачне типове ресурса
4. **Ограничења нивоа услуге** - Ограничења заснована на вашем плану услуге

### Уобичајене квоте ресурса
```bash
# Check current quota usage
az vm list-usage --location eastus2 --output table

# Check specific resource quotas
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Провере капацитета пре примене

### Аутоматизована скрипта за проверу капацитета
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

### Провере капацитета специфичне за услугу

#### Капацитет App Service-а
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

#### Капацитет базе података
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

#### Капацитет Container Apps-а
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

## 📍 Провера регионалне доступности

### Доступност услуга по региону
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

### Препоруке за избор региона
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

## 💰 Планирање трошкова и процена

### Процена трошкова ресурса
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

### Препоруке за оптимизацију SKU-а
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

## 🚀 Аутоматизоване провере пре примене

### Свеобухватна скрипта за провере пре примене
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

### Шаблон конфигурационог фајла
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

## 📈 Праћење капацитета током примене

### Праћење капацитета у реалном времену
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

## 🔗 Интеграција са AZD

### Додавање провера пре примене у azure.yaml
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

## Најбоље праксе

1. **Увек извршите провере капацитета** пре примене у нове регионе
2. **Редовно пратите употребу квота** како бисте избегли изненађења
3. **Планирајте раст** проверавајући будуће потребе за капацитетом
4. **Користите алате за процену трошкова** како бисте избегли неочекиване рачуне
5. **Документујте захтеве за капацитет** за ваш тим
6. **Аутоматизујте проверу капацитета** у CI/CD процесима
7. **Размотрите захтеве за капацитет у случају отказа региона**

## Следећи кораци

- [Водич за избор SKU-а](sku-selection.md) - Изаберите оптималне нивое услуга
- [Провере пре примене](preflight-checks.md) - Аутоматизоване скрипте за проверу
- [Чит листа](../../resources/cheat-sheet.md) - Брзе референтне команде
- [Речник](../../resources/glossary.md) - Термини и дефиниције

## Додатни ресурси

- [Ограничења Azure претплате](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure калкулатор цена](https://azure.microsoft.com/pricing/calculator/)
- [Azure управљање трошковима](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure регионална доступност](https://azure.microsoft.com/global-infrastructure/services/)

---

**Навигација**
- **Претходна лекција**: [Водич за отклањање грешака](../troubleshooting/debugging.md)
- **Следећа лекција**: [Избор SKU-а](sku-selection.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, молимо вас да имате у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не сносимо одговорност за било каква погрешна тумачења или неспоразуме који могу произаћи из коришћења овог превода.