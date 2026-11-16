# 容量規劃 - Azure 資源可用性與限制

**章節導航：**
- **📚 課程首頁**: [AZD For Beginners](../../README.md)
- **📖 本章**: 第6章 - 部署前驗證與規劃
- **⬅️ 上一章**: [第5章：多代理人工智能解決方案](../../examples/retail-scenario.md)
- **➡️ 下一章**: [SKU 選擇](sku-selection.md)
- **🚀 下一章節**: [第7章：故障排除](../chapter-07-troubleshooting/common-issues.md)

## 介紹

本綜合指南協助您在使用 Azure Developer CLI 部署之前，規劃及驗證 Azure 資源容量。學習評估配額、可用性及區域限制，以確保部署成功並優化成本及效能。掌握不同應用架構與擴展場景下的容量規劃技巧。

## 學習目標

完成本指南後，您將能：
- 了解 Azure 配額、限制及區域可用性限制
- 精通部署前檢查資源可用性與容量的技巧
- 實作自動化容量驗證及監測策略
- 設計具適當資源大小與擴展考量的應用
- 透過智能容量規劃應用成本優化策略
- 設定配額使用與資源可用性警示及監控

## 學習成果

完成後，您將能：
- 評估並驗證部署前 Azure 資源容量需求
- 撰寫自動化容量檢查與配額監控腳本
- 設計考量區域及訂閱限制的可擴展架構
- 實施不同工作負載類型的成本效益資源配置策略
- 設定前瞻性容量問題監控與警示
- 規劃多區域部署並適當分配容量

## 容量規劃的重要性

> **範圍：** 這些 Bash 範例需要 Azure CLI、`jq` 及已選擇訂閱。它們檢查發佈的服務及配額；並不證明實體容量或保留資源。請將範例儲存/調整應用於您自己的專案 — 以下腳本/配置檔案名稱僅示範用，非提交品。VM 配額不涵蓋容器應用、App Service 或 Azure OpenAI 配額。

在部署應用前，您需確保：
- <strong>有足夠配額</strong> 支援所需資源
- 目標區域的 <strong>資源可用性</strong>
- 您訂閱類型的 <strong>服務方案可用性</strong>
- 預期流量的 <strong>網絡容量</strong>
- 透過適當配置達成 <strong>成本優化</strong>

## 📊 了解 Azure 配額與限制

### 限制類型
1. <strong>訂閱層級配額</strong> - 每訂閱的最大資源量
2. <strong>區域配額</strong> - 每區域的最大資源量
3. <strong>資源特定限制</strong> - 個別資源類型的限制
4. <strong>服務方案限制</strong> - 根據您的服務計劃之限制

### 常見資源配額
```bash
# Check current quota usage
az vm list-usage --location eastus2 --output table

# Check specific resource quotas
az network list-usages --location eastus2 --output table
az storage account show-usage --location eastus2 --output table
```

## 部署前容量檢查

### 自動容量驗證腳本
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
            usage=$(az vm list-usage --location "$LOCATION" --query "[?name.value=='cores'].{current:currentValue,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.[0].current')
            limit=$(echo "$usage" | jq -r '.[0].limit')
            ;;
        "storage")
            usage=$(az storage account show-usage --location "$LOCATION" --query "{current:currentValue,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.current')
            limit=$(echo "$usage" | jq -r '.limit')
            ;;
        "network")
            usage=$(az network list-usages --location "$LOCATION" --query "[?name.value=='VirtualNetworks'].{current:currentValue,limit:limit}" -o json)
            current=$(echo "$usage" | jq -r '.[0].current')
            limit=$(echo "$usage" | jq -r '.[0].limit')
            ;;
    esac
    
    if ! [[ "$current" =~ ^[0-9]+$ && "$limit" =~ ^[0-9]+$ ]]; then
        echo "❌ Quota data missing or unrecognized for $resource_type"
        return 1
    fi
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

### 服務特定容量檢查

#### App Service 容量
```bash
# Check App Service Plan availability
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Check available SKUs in region
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location' || name=='$(az account list-locations --query "[?name=='$location'].displayName | [0]" -o tsv)']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is listed for $location (not a capacity guarantee)"
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

#### 資料庫容量
```bash
# Check PostgreSQL capacity
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Inspect the nested regional capability catalog; do not assume top-level
    # entries are VM SKU names. Select supported tier/version/SKU combinations.
    available=$(az postgres flexible-server list-skus --location "$location" \
        --output json)
    
    if [ -n "$available" ] && [ "$available" != "[]" ]; then
        echo "$available" | jq .
        echo "Inspect the catalog for $sku; this does not verify physical capacity."
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Show available SKUs
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --output json
        return 1
    fi
}

# Check Cosmos DB capacity
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Check region availability
    display_location=$(az account list-locations --query "[?name=='$location'].displayName | [0]" -o tsv)
    available_regions=$(az cosmosdb locations list --query "[?name=='$display_location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Check if serverless is supported (if needed)
        if [ "$tier" = "serverless" ]; then
            echo "Verify serverless support and limits separately in Cosmos DB documentation."
            echo "Availability-zone support is NOT a serverless-support signal."
        fi
    else
        echo "❌ Cosmos DB is not available in $location"
        return 1
    fi
}
```

#### 容器應用容量
```bash
# Check Container Apps capacity
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Check if Container Apps is available in region
    display_location=$(az account list-locations --query "[?name=='$location'].displayName | [0]" -o tsv)
    if az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations[]" \
        --output tsv | grep -Fxq "$display_location"; then
        echo "✅ Container Apps is available in $location"
        
        # Check current environment count
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        echo "Check Microsoft.App quotas for this subscription/region in Azure Quotas."
        echo "An environment count alone does not establish available quota."
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

## 📍 區域可用性驗證

### 各區域服務可用性
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
            echo "PostgreSQL offerings for candidate region eastus2:"
            az postgres flexible-server list-skus --location eastus2 --output json
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

### 區域選擇討論（示範）

以下標籤為調查提示，非經核實的價格、硬體或合規性排名。請比較當前區域價格及測量延遲。GDPR 並不特定要求德國區域；需整體評估居住地、服務功能及組織/法律需求。
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
            echo "  - East US 2 (Virginia) - Measure latency to your users"
            echo "  - West US 2 (Washington) - Verify required SKUs"
            echo "  - North Europe (Ireland) - For EU users"
            ;;
        "compliance")
            echo "🔒 Compliance-focused regions:"
            echo "  - US Gov regions - For government workloads"
            echo "  - EU regions - Assess residency and contractual requirements"
            echo "  - Australia regions - For data sovereignty"
            ;;
    esac
}
```

## 💰 成本規劃與估算

### 資源成本估算
```bash
# Estimate deployment costs
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Review declared resources locally. ARM validate/what-if do NOT price them.
    # Do not create/delete a resource group just to estimate cost.
    az bicep build --file infra/main.bicep --stdout |
      jq -r '.resources[] | [.type, (.sku.name // "see module/parameters")] | @tsv'
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU 優化建議
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

## 🚀 自動化部署前檢查

### 全方位部署前腳本
```bash
#!/bin/bash
# preflight-check.sh - Complete pre-deployment validation
# Starting-point example: adapt service checks and supply project-specific costs.

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
    SUBSCRIPTION_ID=$(az account show --query id -o tsv)
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
    --query "[?name.value=='cores'].{current:currentValue,limit:limit}" -o json)
vcpu_current=$(echo "$vcpu_usage" | jq -r '.[0].current')
vcpu_limit=$(echo "$vcpu_usage" | jq -r '.[0].limit')
[[ "$vcpu_current" =~ ^[0-9]+$ && "$vcpu_limit" =~ ^[0-9]+$ ]] || { log_error "Missing VM quota data"; exit 1; }
vcpu_available=$((vcpu_limit - vcpu_current))

if [ "$vcpu_available" -ge "$REQUIRED_VCPUS" ]; then
    log_info "vCPU quota: $vcpu_available/$vcpu_limit available (need $REQUIRED_VCPUS)"
else
    log_error "Insufficient vCPU quota: $vcpu_available/$vcpu_limit available (need $REQUIRED_VCPUS)"
    exit 1
fi

# Storage account quota
storage_usage=$(az storage account show-usage --location "$LOCATION" --query "{current:currentValue,limit:limit}" -o json)
storage_current=$(echo "$storage_usage" | jq -r '.current')
storage_limit=$(echo "$storage_usage" | jq -r '.limit')
[[ "$storage_current" =~ ^[0-9]+$ && "$storage_limit" =~ ^[0-9]+$ ]] || { log_error "Missing storage quota data"; exit 1; }
storage_available=$((storage_limit - storage_current))

if [ "$storage_available" -ge "$REQUIRED_STORAGE" ]; then
    log_info "Storage quota: $storage_available/$storage_limit available (need $REQUIRED_STORAGE)"
else
    log_error "Insufficient storage quota: $storage_available/$storage_limit available (need $REQUIRED_STORAGE)"
    exit 1
fi

# Check 4: Service availability
log_info "Checking service availability..."
DISPLAY_LOCATION=$(az account list-locations --query "[?name=='$LOCATION'].displayName | [0]" -o tsv)

for service in "${REQUIRED_SERVICES[@]}"; do
    case $service in
        "appservice")
            if az appservice list-locations --sku B1 --query "[?name=='$LOCATION' || name=='$DISPLAY_LOCATION']" -o tsv | grep -q .; then
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
                --output tsv | grep -Fxq "$DISPLAY_LOCATION"; then
                log_info "Container Apps is available in $LOCATION"
            else
                log_error "Container Apps is not available in $LOCATION"
                exit 1
            fi
            ;;
        "cosmosdb")
            if az cosmosdb locations list --query "[?name=='$DISPLAY_LOCATION']" -o tsv | grep -q .; then
                log_info "Cosmos DB is available in $LOCATION"
            else
                log_error "Cosmos DB is not available in $LOCATION"
                exit 1
            fi
            ;;
        "storage")
            log_info "Storage account quota checked above; validate the selected SKU separately."
            ;;
        *)
            log_error "No check implemented for service: $service"; exit 1
            ;;
    esac
done

# Check 5: Network capacity
log_info "Checking network capacity..."
vnet_usage=$(az network list-usages --location "$LOCATION" \
    --query "[?name.value=='VirtualNetworks'].{current:currentValue,limit:limit}" -o json)
vnet_current=$(echo "$vnet_usage" | jq -r '.[0].current')
vnet_limit=$(echo "$vnet_usage" | jq -r '.[0].limit')
[[ "$vnet_current" =~ ^[0-9]+$ && "$vnet_limit" =~ ^[0-9]+$ ]] || { log_error "Missing network quota data"; exit 1; }
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
# Set this from a reviewed Pricing Calculator estimate; no built-in pricing API
# is implemented by this example.
: "${ESTIMATED_MONTHLY_COST:?Set ESTIMATED_MONTHLY_COST to your reviewed estimate}"
[[ "$ESTIMATED_MONTHLY_COST" =~ ^[0-9]+$ ]] || { log_error "Use an integer cost estimate"; exit 1; }
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
log_info "✅ Implemented checks passed; review remaining service-specific limits."
log_info "Quota is not a reservation or guarantee of capacity in $LOCATION."
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### 配置檔範本
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

## 📈 部署中容量監控

### 即時容量監控
```bash
# Monitor capacity during deployment
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Check deployment status
        deployment_status=$(az deployment group list \
            --resource-group "$resource_group" \
            --query "sort_by(@, &properties.timestamp)[-1].properties.provisioningState" -o tsv)
        
        if [ "$deployment_status" = "Succeeded" ]; then
            log_info "Deployment completed successfully"
            break
        elif [ "$deployment_status" = "Failed" ] || [ "$deployment_status" = "Canceled" ]; then
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

## 🔗 與 AZD 整合

### 將部署前掛鉤新增至 azure.yaml
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      set -e
      echo "Running pre-flight capacity checks..."
      bash ./scripts/preflight-check.sh "${AZURE_LOCATION}" "${AZURE_ENV_NAME}"
      
      if [ $? -ne 0 ]; then
        echo "Pre-flight checks failed"
        exit 1
      fi
      
      echo "Pre-flight checks passed, proceeding with deployment"
```

## 優良實踐

1. **部署至新區域前，務必執行容量檢查**
2. <strong>定期監控配額使用量</strong>，避免意外
3. <strong>規劃成長</strong>，預估未來容量需求
4. <strong>使用成本估算工具</strong>，避免帳單震盪
5. <strong>記錄容量需求</strong> 給團隊參考
6. **在 CI/CD 流程中自動化容量驗證**
7. <strong>考慮區域故障轉移的容量需求</strong>

## 下一步

- [SKU 選擇指南](sku-selection.md) - 選擇最佳服務方案
- [部署前檢查](preflight-checks.md) - 自動驗證腳本
- [備忘清單](../../resources/cheat-sheet.md) - 常用指令快速參考
- [術語表](../../resources/glossary.md) - 名詞與定義

## 附加資源

- [Azure 訂閱限制](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure 價格計算器](https://azure.microsoft.com/pricing/calculator/)
- [Azure 成本管理](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure 區域可用性](https://azure.microsoft.com/global-infrastructure/services/)

---

<strong>導覽</strong>
- <strong>上一課</strong>: [除錯指南](../chapter-07-troubleshooting/debugging.md)

- <strong>下一課</strong>: [SKU 選擇](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->