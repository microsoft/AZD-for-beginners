# برنامه‌ریزی ظرفیت - دسترس‌پذیری و محدودیت‌های منابع Azure

**Chapter Navigation:**
- **📚 صفحهٔ دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل 6 - اعتبارسنجی و برنامه‌ریزی پیش‌از استقرار
- **⬅️ فصل قبلی**: [فصل 5: راه‌حل‌های چندعاملۀ هوش مصنوعی](../../examples/retail-scenario.md)
- **➡️ بعدی**: [انتخاب SKU](sku-selection.md)
- **🚀 فصل بعدی**: [فصل 7: عیب‌یابی](../chapter-07-troubleshooting/common-issues.md)

## مقدمه

این راهنمای جامع به شما کمک می‌کند تا ظرفیت منابع Azure را پیش از استقرار با Azure Developer CLI برنامه‌ریزی و اعتبارسنجی کنید. بیاموزید چگونه سهمیه‌ها، دسترس‌پذیری و محدودیت‌های منطقه‌ای را ارزیابی کنید تا از استقرارهای موفق اطمینان حاصل کنید و هم‌زمان هزینه‌ها و عملکرد را بهینه کنید. تکنیک‌های برنامه‌ریزی ظرفیت برای معماری‌های مختلف برنامه و سناریوهای مقیاس‌پذیری را فرا بگیرید.

## اهداف یادگیری

با تکمیل این راهنما، شما خواهید توانست:
- درک سهمیه‌ها، محدودیت‌ها و محدودیت‌های دسترس‌پذیری منطقه‌ای Azure
- تسلط بر تکنیک‌های بررسی دسترس‌پذیری و ظرفیت پیش از استقرار
- پیاده‌سازی استراتژی‌های خودکار برای اعتبارسنجی ظرفیت و پایش
- طراحی برنامه‌ها با اندازه‌گذاری و ملاحظات مقیاس‌پذیری مناسب
- اعمال استراتژی‌های بهینه‌سازی هزینه از طریق برنامه‌ریزی ظرفیت هوشمندانه
- پیکربندی هشدارها و پایش برای استفاده از سهمیه و دسترس‌پذیری منابع

## دستاوردهای یادگیری

پس از اتمام، شما قادر خواهید بود:
- ارزیابی و اعتبارسنجی نیازهای ظرفیت منابع Azure پیش از استقرار
- ایجاد اسکریپت‌های خودکار برای بررسی ظرفیت و پایش سهمیه‌ها
- طراحی معماری‌های مقیاس‌پذیر که محدودیت‌های منطقه‌ای و اشتراکی را در نظر می‌گیرند
- پیاده‌سازی استراتژی‌های اندازه‌گذاری منابع کم‌هزینه برای انواع بار کاری
- پیکربندی پایش و هشداردهی پیشگیرانه برای مسائل مرتبط با ظرفیت
- برنامه‌ریزی استقرارهای چندمنطقه‌ای با توزیع مناسب ظرفیت

## چرا برنامه‌ریزی ظرفیت اهمیت دارد

پیش از استقرار برنامه‌ها، باید اطمینان حاصل کنید:
- **سهمیه‌های کافی** برای منابع مورد نیاز
- **دسترس‌پذیری منابع** در منطقه هدف شما
- **دسترس‌پذیری سطح سرویس** برای نوع اشتراک شما
- **ظرفیت شبکه** برای ترافیک مورد انتظار
- **بهینه‌سازی هزینه** از طریق اندازه‌گذاری مناسب

## 📊 درک سهمیه‌ها و محدودیت‌های Azure

### انواع محدودیت‌ها
1. **سهمیه‌های سطح اشتراک** - حداکثر منابع در هر اشتراک
2. **سهمیه‌های منطقه‌ای** - حداکثر منابع در هر منطقه
3. **محدودیت‌های خاص منبع** - محدودیت‌ها برای انواع منابع منفرد
4. **محدودیت‌های سطح سرویس** - محدودیت‌ها براساس پلن سرویس شما

### سهمیه‌های رایج منابع
```bash
# میزان استفاده فعلی از سهمیه را بررسی کنید
az vm list-usage --location eastus2 --output table

# سهمیه‌های منابع مشخص را بررسی کنید
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## بررسی‌های ظرفیت پیش از استقرار

### اسکریپت اعتبارسنجی ظرفیت خودکار
```bash
#!/bin/bash
# capacity-check.sh - اعتبارسنجی ظرفیت Azure قبل از استقرار

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# تابعی برای بررسی مصرف سهمیه
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

# بررسی سهمیه‌های مختلف منابع
check_quota "compute" 4      # نیاز به ۴ vCPU
check_quota "storage" 2      # نیاز به ۲ حساب ذخیره‌سازی
check_quota "network" 1      # نیاز به ۱ شبکه مجازی

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### چک‌های ظرفیت مخصوص سرویس

#### ظرفیت App Service
```bash
# بررسی در دسترس بودن طرح App Service
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # بررسی SKUهای در دسترس در منطقه
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # پیشنهاد مناطق جایگزین
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # بررسی مصرف فعلی
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# مصرف
check_app_service_capacity "eastus2" "P1v3"
```

#### ظرفیت پایگاه‌داده
```bash
# ظرفیت PostgreSQL را بررسی کنید
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # بررسی کنید که SKU در دسترس است
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # SKUهای موجود را نمایش دهید
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# ظرفیت Cosmos DB را بررسی کنید
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # در دسترس بودن منطقه را بررسی کنید
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # بررسی کنید که حالت بدون‌سرور پشتیبانی می‌شود (در صورت نیاز)
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

#### ظرفیت Container Apps
```bash
# ظرفیت Container Apps را بررسی کنید
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # بررسی کنید آیا Container Apps در منطقه در دسترس است
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # تعداد محیط‌های فعلی را بررسی کنید
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps محدودیت ۱۵ محیط در هر منطقه دارد
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # مناطق در دسترس را نشان دهید
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 اعتبارسنجی دسترس‌پذیری منطقه‌ای

### دسترس‌پذیری سرویس بر اساس منطقه
```bash
# بررسی در دسترس بودن سرویس‌ها در مناطق مختلف
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

# بررسی همه سرویس‌ها
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### توصیه‌های انتخاب منطقه
```bash
# پیشنهاد مناطق بهینه بر اساس نیازها
recommend_region() {
    local requirements=$1  # "کم‌هزینه" | "عملکرد" | "انطباق"
    
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

## 💰 برنامه‌ریزی و برآورد هزینه

### برآورد هزینه منابع
```bash
# تخمین هزینه‌های استقرار
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # ایجاد گروه منبع موقت برای برآورد
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # استقرار زیرساخت در حالت اعتبارسنجی
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # پاکسازی گروه منبع موقت
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### توصیه‌های بهینه‌سازی SKU
```bash
# پیشنهاد SKUهای بهینه بر اساس نیازها
recommend_sku() {
    local service=$1
    local workload_type=$2  # "توسعه" | "آزمایشی" | "تولید"
    
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

## 🚀 چک‌های پیش‌اجرایی خودکار

### اسکریپت جامع پیش‌اجرایی
```bash
#!/bin/bash
# preflight-check.sh - ارزیابی کامل پیش از استقرار

set -e

# پیکربندی
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# رنگ‌ها برای خروجی
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # بدون رنگ

# توابع لاگ‌گیری
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# بارگذاری پیکربندی
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

# بررسی 1: احراز هویت
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# بررسی 2: در دسترس بودن منطقه‌ای
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# بررسی 3: اعتبارسنجی سهمیه
log_info "Checking quota availability..."

# سهمیه vCPU
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

# سهمیه حساب ذخیره‌سازی
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

# بررسی 4: در دسترس بودن سرویس
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

# بررسی 5: ظرفیت شبکه
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

# بررسی 6: اعتبارسنجی نام‌گذاری منابع
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# بررسی 7: برآورد هزینه
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

# بررسی 8: اعتبارسنجی قالب
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

# خلاصه نهایی
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### قالب فایل پیکربندی
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

## 📈 پایش ظرفیت در حین استقرار

### نظارت بلادرنگ بر ظرفیت
```bash
# نظارت بر ظرفیت در حین استقرار
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # بررسی وضعیت استقرار
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
        
        # بررسی استفاده فعلی از منابع
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 یکپارچگی با AZD

### افزودن هوک‌های پیش‌اجرایی به azure.yaml
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

## بهترین شیوه‌ها

1. **همیشه چک‌های ظرفیت را اجرا کنید** پیش از استقرار در مناطق جدید
2. **استفاده از سهمیه را به‌صورت منظم پایش کنید** تا از شگفتی‌ها جلوگیری شود
3. **برای رشد برنامه‌ریزی کنید** با بررسی نیازهای ظرفیت آینده
4. **از ابزارهای برآورد هزینه استفاده کنید** تا از افزایش ناگهانی صورتحساب جلوگیری شود
5. **نیازهای ظرفیت را برای تیم خود مستند کنید**
6. **اعتبارسنجی ظرفیت را در CI/CD خودکار کنید**
7. **نیازهای ظرفیت بازیابی منطقه‌ای** را در نظر بگیرید

## گام‌های بعدی

- [راهنمای انتخاب SKU](sku-selection.md) - انتخاب سطوح سرویس بهینه
- [چک‌های پیش‌اجرایی](preflight-checks.md) - اسکریپت‌های اعتبارسنجی خودکار
- [راهنمای سریع](../../resources/cheat-sheet.md) - فرمان‌های مرجع سریع
- [واژه‌نامه](../../resources/glossary.md) - اصطلاحات و تعاریف

## منابع اضافی

- [محدودیت‌های اشتراک Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [محاسبه‌گر قیمت Azure](https://azure.microsoft.com/pricing/calculator/)
- [مدیریت هزینه Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [دسترس‌پذیری منطقه‌ای Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigation**
- **درس قبلی**: [راهنمای اشکال‌زدایی](../chapter-07-troubleshooting/debugging.md)

- **درس بعدی**: [انتخاب SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
سلب مسئولیت:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی Co-op Translator (https://github.com/Azure/co-op-translator) ترجمه شده است. اگرچه ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطا یا نادرستی باشند. نسخهٔ اصلی سند به زبانِ اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای توسط مترجم انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->