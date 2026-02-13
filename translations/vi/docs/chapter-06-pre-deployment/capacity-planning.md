# Lập kế hoạch dung lượng - Khả dụng tài nguyên Azure và Giới hạn

**Điều hướng chương:**
- **📚 Trang khóa học**: [AZD cho Người mới bắt đầu](../../README.md)
- **📖 Chương hiện tại**: Chương 6 - Xác thực & Lập kế hoạch trước khi triển khai
- **⬅️ Chương trước**: [Chương 5: Giải pháp AI đa tác nhân](../../examples/retail-scenario.md)
- **➡️ Tiếp theo**: [Lựa chọn SKU](sku-selection.md)
- **🚀 Chương kế tiếp**: [Chương 7: Khắc phục sự cố](../chapter-07-troubleshooting/common-issues.md)

## Giới thiệu

Hướng dẫn toàn diện này giúp bạn lập kế hoạch và xác thực dung lượng tài nguyên Azure trước khi triển khai bằng Azure Developer CLI. Tìm hiểu cách đánh giá hạn ngạch, tính khả dụng và các giới hạn theo khu vực để đảm bảo triển khai thành công đồng thời tối ưu chi phí và hiệu năng. Nắm vững các kỹ thuật lập kế hoạch dung lượng cho các kiến trúc ứng dụng và kịch bản mở rộng khác nhau.

## Mục tiêu học tập

Hoàn thành hướng dẫn này, bạn sẽ:
- Hiểu về hạn ngạch, giới hạn và các ràng buộc sẵn có theo khu vực của Azure
- Thành thạo các kỹ thuật kiểm tra khả dụng và dung lượng trước khi triển khai
- Triển khai các chiến lược xác thực dung lượng và giám sát tự động
- Thiết kế ứng dụng với kích thước tài nguyên và cân nhắc mở rộng phù hợp
- Áp dụng chiến lược tối ưu hóa chi phí thông qua lập kế hoạch dung lượng thông minh
- Cấu hình cảnh báo và giám sát cho việc sử dụng hạn ngạch và tính khả dụng tài nguyên

## Kết quả học tập

Sau khi hoàn thành, bạn sẽ có thể:
- Đánh giá và xác thực yêu cầu dung lượng tài nguyên Azure trước khi triển khai
- Tạo các script tự động để kiểm tra dung lượng và giám sát hạn ngạch
- Thiết kế kiến trúc có thể mở rộng, tính đến giới hạn theo khu vực và theo đăng ký
- Thực hiện các chiến lược định kích thước tài nguyên tiết kiệm chi phí cho các loại khối lượng công việc khác nhau
- Cấu hình giám sát và cảnh báo chủ động cho các vấn đề liên quan đến dung lượng
- Lập kế hoạch triển khai đa khu vực với phân bổ dung lượng hợp lý

## Tại sao lập kế hoạch dung lượng lại quan trọng

Trước khi triển khai ứng dụng, bạn cần đảm bảo:
- **Đủ hạn ngạch** cho các tài nguyên cần thiết
- **Tính khả dụng tài nguyên** trong khu vực mục tiêu của bạn
- **Sẵn có bậc dịch vụ** cho loại đăng ký của bạn
- **Dung lượng mạng** cho lưu lượng dự kiến
- **Tối ưu chi phí** thông qua việc định kích thước hợp lý

## 📊 Hiểu về hạn ngạch và giới hạn Azure

### Các loại giới hạn
1. **Hạn ngạch cấp đăng ký** - Số lượng tối đa tài nguyên trên mỗi đăng ký
2. **Hạn ngạch theo khu vực** - Số lượng tối đa tài nguyên trên mỗi khu vực
3. **Giới hạn riêng theo loại tài nguyên** - Giới hạn cho từng loại tài nguyên
4. **Giới hạn theo bậc dịch vụ** - Giới hạn dựa trên gói dịch vụ của bạn

### Hạn ngạch tài nguyên phổ biến
```bash
# Kiểm tra mức sử dụng hạn ngạch hiện tại
az vm list-usage --location eastus2 --output table

# Kiểm tra các hạn ngạch tài nguyên cụ thể
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Kiểm tra dung lượng trước khi triển khai

### Script xác thực dung lượng tự động
```bash
#!/bin/bash
# capacity-check.sh - Kiểm tra dung lượng Azure trước khi triển khai

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Hàm để kiểm tra việc sử dụng hạn ngạch
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

# Kiểm tra các hạn ngạch tài nguyên khác nhau
check_quota "compute" 4      # Cần 4 vCPU
check_quota "storage" 2      # Cần 2 tài khoản lưu trữ
check_quota "network" 1      # Cần 1 mạng ảo

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Kiểm tra dung lượng theo dịch vụ

#### Dung lượng App Service
```bash
# Kiểm tra tính khả dụng của App Service Plan
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Kiểm tra các SKU có sẵn trong khu vực
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Đề xuất các khu vực thay thế
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Kiểm tra mức sử dụng hiện tại
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Sử dụng
check_app_service_capacity "eastus2" "P1v3"
```

#### Dung lượng Database
```bash
# Kiểm tra dung lượng PostgreSQL
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Kiểm tra xem SKU có sẵn hay không
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Hiển thị các SKU có sẵn
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Kiểm tra dung lượng Cosmos DB
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Kiểm tra khả dụng của khu vực
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Kiểm tra xem serverless có được hỗ trợ hay không (nếu cần)
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

#### Dung lượng Container Apps
```bash
# Kiểm tra công suất Container Apps
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Kiểm tra xem Container Apps có khả dụng trong khu vực hay không
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Kiểm tra số lượng môi trường hiện tại
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps có giới hạn 15 môi trường cho mỗi khu vực
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Hiển thị các khu vực khả dụng
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Xác thực sẵn có theo khu vực

### Sẵn có dịch vụ theo khu vực
```bash
# Kiểm tra tính khả dụng của dịch vụ ở các khu vực
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

# Kiểm tra tất cả các dịch vụ
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Khuyến nghị lựa chọn khu vực
```bash
# Đề xuất các vùng tối ưu dựa trên yêu cầu
recommend_region() {
    local requirements=$1  # "chi phí thấp" | "hiệu suất" | "tuân thủ"
    
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

## 💰 Lập kế hoạch và ước tính chi phí

### Ước tính chi phí tài nguyên
```bash
# Ước tính chi phí triển khai
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Tạo nhóm tài nguyên tạm thời để ước tính
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Triển khai hạ tầng ở chế độ xác thực
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Dọn dẹp nhóm tài nguyên tạm thời
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### Khuyến nghị tối ưu SKU
```bash
# Đề xuất SKU tối ưu dựa trên yêu cầu
recommend_sku() {
    local service=$1
    local workload_type=$2  # "phát triển" | "dàn dựng" | "sản xuất"
    
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

## 🚀 Kiểm tra trước khi triển khai tự động

### Script kiểm tra toàn diện trước khi triển khai
```bash
#!/bin/bash
# preflight-check.sh - Kiểm tra trước khi triển khai hoàn chỉnh

set -e

# Configuration: Cấu hình
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Colors for output: Màu sắc cho đầu ra
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color: Không màu

# Logging functions: Các hàm ghi nhật ký
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Load configuration: Tải cấu hình
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

# Check 1: Authentication: Kiểm tra 1: Xác thực
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Check 2: Regional availability: Kiểm tra 2: Sẵn có theo khu vực
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Check 3: Quota validation: Kiểm tra 3: Xác thực hạn mức
log_info "Checking quota availability..."

# vCPU quota: Hạn mức vCPU
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

# Storage account quota: Hạn mức tài khoản lưu trữ
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

# Check 4: Service availability: Kiểm tra 4: Sẵn có dịch vụ
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

# Check 5: Network capacity: Kiểm tra 5: Dung lượng mạng
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

# Check 6: Resource naming validation: Kiểm tra 6: Xác thực tên tài nguyên
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Check 7: Cost estimation: Kiểm tra 7: Ước tính chi phí
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

# Check 8: Template validation: Kiểm tra 8: Xác thực mẫu
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

# Final summary: Tóm tắt cuối cùng
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Mẫu tệp cấu hình
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

## 📈 Giám sát dung lượng trong khi triển khai

### Giám sát dung lượng theo thời gian thực
```bash
# Giám sát dung lượng trong quá trình triển khai
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Kiểm tra trạng thái triển khai
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
        
        # Kiểm tra mức sử dụng tài nguyên hiện tại
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 Tích hợp với AZD

### Thêm hook kiểm tra trước khi triển khai vào azure.yaml
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

## Thực hành tốt nhất

1. **Luôn chạy kiểm tra dung lượng** trước khi triển khai sang khu vực mới
2. **Giám sát việc sử dụng hạn ngạch thường xuyên** để tránh bất ngờ
3. **Lập kế hoạch cho sự phát triển** bằng cách kiểm tra nhu cầu dung lượng trong tương lai
4. **Sử dụng công cụ ước tính chi phí** để tránh số tiền hóa đơn bất ngờ
5. **Ghi chép yêu cầu dung lượng** cho đội ngũ của bạn
6. **Tự động hóa xác thực dung lượng** trong CI/CD pipelines
7. **Xem xét yêu cầu dung lượng dự phòng theo khu vực** cho khả năng chuyển đổi dự phòng

## Bước tiếp theo

- [SKU Selection Guide](sku-selection.md) - Chọn bậc dịch vụ tối ưu
- [Pre-flight Checks](preflight-checks.md) - Script xác thực tự động
- [Cheat Sheet](../../resources/cheat-sheet.md) - Lệnh tham chiếu nhanh
- [Glossary](../../resources/glossary.md) - Thuật ngữ và định nghĩa

## Tài nguyên bổ sung

- [Giới hạn đăng ký Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Bộ tính giá Azure](https://azure.microsoft.com/pricing/calculator/)
- [Quản lý chi phí Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Sẵn có khu vực Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**Điều hướng**
- **Bài trước**: [Hướng dẫn gỡ lỗi](../chapter-07-troubleshooting/debugging.md)

- **Bài tiếp theo**: [Lựa chọn SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc thiếu chính xác. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn chính thức. Đối với các thông tin quan trọng, nên sử dụng bản dịch do người dịch chuyên nghiệp thực hiện. Chúng tôi không chịu trách nhiệm cho bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->