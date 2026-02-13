# تخطيط السعة - توافر موارد Azure والحدود

**التنقل بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 6 - التحقق والتخطيط قبل النشر
- **⬅️ الفصل السابق**: [الفصل 5: حلول الذكاء الاصطناعي متعددة الوكلاء](../../examples/retail-scenario.md)
- **➡️ التالي**: [اختيار SKU](sku-selection.md)
- **🚀 الفصل التالي**: [الفصل 7: استكشاف الأخطاء وإصلاحها](../chapter-07-troubleshooting/common-issues.md)

## المقدمة

هذا الدليل الشامل يساعدك على التخطيط والتحقق من سعة موارد Azure قبل النشر باستخدام Azure Developer CLI. تعلّم تقييم الحصص والتوافر والقيود الإقليمية لضمان نشر ناجح مع تحسين التكاليف والأداء. أتقن تقنيات تخطيط السعة لأنماط بنية التطبيقات المختلفة وسيناريوهات التحجيم.

## أهداف التعلم

بإكمال هذا الدليل، ستتمكن من:
- فهم الحصص والحدود وتقييدات التوفر الإقليمي في Azure
- إتقان تقنيات التحقق من توفر الموارد والقدرة قبل النشر
- تنفيذ استراتيجيات التحقق الآلي من السعة والمراقبة
- تصميم التطبيقات مع مراعاة حجم الموارد المناسب وآليات التحجيم
- تطبيق استراتيجيات تحسين التكلفة عبر تخطيط سعة ذكي
- تكوين التنبيهات والمراقبة لاستخدام الحصص وتوفر الموارد

## نتائج التعلم

عند الانتهاء، ستتمكن من:
- تقييم والتحقق من متطلبات سعة موارد Azure قبل النشر
- إنشاء نصوص آلية لفحص السعة ومراقبة الحصص
- تصميم معماريات قابلة للتوسع تأخذ في الاعتبار الحدود الإقليمية وقيود الاشتراك
- تنفيذ استراتيجيات تحديد حجم موارد فعّالة من حيث التكلفة لأنواع أحمال عمل مختلفة
- تكوين مراقبة وتنبيهات استباقية لمشكلات متعلقة بالسعة
- تخطيط عمليات النشر متعددة المناطق مع توزيع سعة مناسب

## لماذا يهم تخطيط السعة

قبل نشر التطبيقات، تحتاج إلى التأكد من:
- **حصص كافية** للموارد المطلوبة
- **توفر الموارد** في منطقتك المستهدفة
- **توفر مستوى الخدمة** لنوع اشتراكك
- **سعة الشبكة** لحركة المرور المتوقعة
- **تحسين التكلفة** من خلال تحديد الحجم المناسب

## 📊 فهم حصص وحدود Azure

### أنواع الحدود
1. **حصص على مستوى الاشتراك** - الحد الأقصى للموارد لكل اشتراك
2. **الحصص الإقليمية** - الحد الأقصى للموارد لكل منطقة
3. **قيود محددة للموارد** - حدود لأنواع الموارد الفردية
4. **قيود مستوى الخدمة** - حدود بناءً على خطة الخدمة الخاصة بك

### حصص الموارد الشائعة
```bash
# تحقق من استخدام الحصة الحالية
az vm list-usage --location eastus2 --output table

# تحقق من حصص الموارد المحددة
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## فحوصات السعة قبل النشر

### نص التحقق الآلي من السعة
```bash
#!/bin/bash
# capacity-check.sh - التحقق من سعة Azure قبل النشر

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# دالة للتحقق من استخدام الحصص
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

# التحقق من حصص الموارد المختلفة
check_quota "compute" 4      # بحاجة إلى 4 نوى vCPU
check_quota "storage" 2      # بحاجة إلى حسابَيْن للتخزين
check_quota "network" 1      # بحاجة إلى شبكة افتراضية واحدة

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### فحوصات السعة الخاصة بالخدمة

#### سعة App Service
```bash
# التحقق من توفر خطة خدمة التطبيقات
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # التحقق من وحدات SKU المتاحة في المنطقة
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # اقتراح مناطق بديلة
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # التحقق من الاستخدام الحالي
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# الاستخدام
check_app_service_capacity "eastus2" "P1v3"
```

#### سعة قاعدة البيانات
```bash
# تحقق من سعة PostgreSQL
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # تحقق مما إذا كانت الـ SKU متاحة
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # عرض وحدات SKU المتاحة
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# تحقق من سعة Cosmos DB
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # تحقق من توافر المنطقة
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # تحقق مما إذا كانت ميزة serverless مدعومة (إذا لزم الأمر)
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

#### سعة Container Apps
```bash
# تحقق من سعة تطبيقات الحاويات
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # تحقق مما إذا كانت تطبيقات الحاويات متاحة في المنطقة
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # تحقق من العدد الحالي للبيئات
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # تطبيقات الحاويات محدودة بـ 15 بيئة لكل منطقة
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # عرض المناطق المتاحة
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 التحقق من التوفر الإقليمي

### توفر الخدمة حسب المنطقة
```bash
# التحقق من توافر الخدمة عبر المناطق
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

# التحقق من جميع الخدمات
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### توصيات اختيار المنطقة
```bash
# اقتراح المناطق المثلى بناءً على المتطلبات
recommend_region() {
    local requirements=$1  # "منخفضة التكلفة" | "الأداء" | "الامتثال"
    
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

## 💰 تخطيط التكلفة والتقدير

### تقدير تكلفة الموارد
```bash
# تقدير تكاليف النشر
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # إنشاء مجموعة موارد مؤقتة للتقدير
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # نشر البنية التحتية في وضع التحقق
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # تنظيف مجموعة الموارد المؤقتة
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### توصيات تحسين SKU
```bash
# اقتراح رموز SKU المثلى بناءً على المتطلبات
recommend_sku() {
    local service=$1
    local workload_type=$2  # "تطوير" | "التجريب" | "الإنتاج"
    
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

## 🚀 فحوصات ما قبل الإقلاع الآلية

### نص شامل لفحوصات ما قبل الإقلاع
```bash
#!/bin/bash
# preflight-check.sh - إتمام التحقق الكامل قبل النشر

set -e

# التكوين
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# ألوان الإخراج
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # بدون لون

# دوال التسجيل
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# تحميل التكوين
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

# التحقق 1: المصادقة
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# التحقق 2: التوفر الإقليمي
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# التحقق 3: التحقق من الحصص
log_info "Checking quota availability..."

# حصة vCPU
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

# حصة حساب التخزين
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

# التحقق 4: توفر الخدمة
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

# التحقق 5: سعة الشبكة
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

# التحقق 6: التحقق من تسمية الموارد
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# التحقق 7: تقدير التكلفة
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

# التحقق 8: التحقق من القالب
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

# الملخص النهائي
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### قالب ملف التكوين
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

## 📈 مراقبة السعة أثناء النشر

### مراقبة السعة في الوقت الفعلي
```bash
# مراقبة السعة أثناء النشر
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # التحقق من حالة النشر
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
        
        # التحقق من استخدام الموارد الحالية
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 التكامل مع AZD

### إضافة نقاط تحقق ما قبل الإقلاع إلى azure.yaml
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

## أفضل الممارسات

1. **قم دائمًا بتشغيل فحوصات السعة** قبل النشر إلى مناطق جديدة
2. **راقب استخدام الحصص بانتظام** لتجنب المفاجآت
3. **خطط للنمو** من خلال التحقق من احتياجات السعة المستقبلية
4. **استخدم أدوات تقدير التكلفة** لتجنب الصدمة من الفواتير
5. **وثق متطلبات السعة** لفريقك
6. **أتمتة التحقق من السعة** في خطوط CI/CD
7. **ضع في الاعتبار متطلبات سعة التحويل عند الفشل الإقليمي**

## الخطوات التالية

- [دليل اختيار SKU](sku-selection.md) - اختيار مستويات الخدمة المثلى
- [فحوصات ما قبل الإقلاع](preflight-checks.md) - نصوص التحقق الآلية
- [دليل مختصر](../../resources/cheat-sheet.md) - أوامر مرجعية سريعة
- [مسرد المصطلحات](../../resources/glossary.md) - المصطلحات والتعريفات

## موارد إضافية

- [حدود اشتراكات Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [حاسبة تسعير Azure](https://azure.microsoft.com/pricing/calculator/)
- [إدارة تكلفة Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [التوفر الإقليمي لـ Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**التنقل**
- **الدرس السابق**: [دليل استكشاف الأخطاء وإصلاحها](../chapter-07-troubleshooting/debugging.md)

- **الدرس التالي**: [اختيار SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء مسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية Co-op Translator (https://github.com/Azure/co-op-translator). رغم أننا نسعى إلى الدقة، يُرجى ملاحظة أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية هو المصدر المرجعي والموثوق. للمعلومات الحساسة أو الحرجة، يُنصح بالاستعانة بترجمة بشرية مهنية. لا نتحمل أي مسؤولية عن أي سوء فهم أو تأويل ينشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->