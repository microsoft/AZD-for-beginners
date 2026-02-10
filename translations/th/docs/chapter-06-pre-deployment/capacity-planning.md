# การวางแผนความจุ - ความพร้อมใช้งานและขีดจำกัดของทรัพยากร Azure

**การนำทางบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 6 - การตรวจสอบและการวางแผนก่อนการปรับใช้
- **⬅️ บทก่อนหน้า**: [บทที่ 5: โซลูชัน AI หลายตัวแทน](../../examples/retail-scenario.md)
- **➡️ ถัดไป**: [การเลือก SKU](sku-selection.md)
- **🚀 บทถัดไป**: [บทที่ 7: การแก้ไขปัญหา](../chapter-07-troubleshooting/common-issues.md)

## บทนำ

ไกด์ฉบับสมบูรณ์นี้ช่วยให้คุณวางแผนและตรวจสอบความจุของทรัพยากร Azure ก่อนการปรับใช้ด้วย Azure Developer CLI เรียนรู้การประเมินโควต้า ความพร้อมใช้งาน และข้อจำกัดตามภูมิภาคเพื่อให้การปรับใช้ประสบความสำเร็จพร้อมทั้งเพิ่มประสิทธิภาพค่าใช้จ่ายและประสิทธิภาพ คว้าทักษะการวางแผนความจุสำหรับสถาปัตยกรรมแอปและสถานการณ์การปรับสเกลต่าง ๆ

## เป้าหมายการเรียนรู้

เมื่อทำคู่มือนี้เสร็จ คุณจะสามารถ:
- เข้าใจโควต้า ขีดจำกัด และข้อจำกัดความพร้อมใช้งานตามภูมิภาคของ Azure
- ชำนาญเทคนิคการตรวจสอบความพร้อมของทรัพยากรก่อนการปรับใช้
- นำกลยุทธ์การตรวจสอบความจุและการมอนิเตอร์แบบอัตโนมัติไปใช้
- ออกแบบแอปโดยพิจารณาการจัดขนาดทรัพยากรและการปรับสเกลอย่างเหมาะสม
- ประยุกต์ใช้กลยุทธ์การปรับให้เหมาะสมด้านค่าใช้จ่ายผ่านการวางแผนความจุอัจฉริยะ
- กำหนดการแจ้งเตือนและการมอนิเตอร์สำหรับการใช้งานโควต้าและความพร้อมของทรัพยากร

## ผลลัพธ์การเรียนรู้

เมื่อสำเร็จ คุณจะสามารถ:
- ประเมินและตรวจสอบความต้องการความจุของทรัพยากร Azure ก่อนการปรับใช้
- สร้างสคริปต์อัตโนมัติสำหรับการตรวจสอบความจุและการมอนิเตอร์โควต้า
- ออกแบบสถาปัตยกรรมที่ปรับขนาดได้โดยคำนึงถึงข้อจำกัดทั้งในระดับภูมิภาคและการสมัครใช้งาน
- นำกลยุทธ์การจัดขนาดทรัพยากรที่คุ้มค่าสำหรับประเภทงานต่าง ๆ ไปใช้
- กำหนดการมอนิเตอร์และการแจ้งเตือนเชิงรุกสำหรับปัญหาที่เกี่ยวข้องกับความจุ
- วางแผนการปรับใช้แบบหลายภูมิภาคโดยจัดสรรความจุอย่างเหมาะสม

## ทำไมการวางแผนความจุจึงสำคัญ

ก่อนปรับใช้แอป คุณต้องแน่ใจว่า:
- **โควต้าที่เพียงพอ** สำหรับทรัพยากรที่ต้องการ
- **ความพร้อมของทรัพยากร** ในภูมิภาคเป้าหมายของคุณ
- **ความพร้อมของระดับบริการ** สำหรับประเภทการสมัครใช้งานของคุณ
- **ความจุเครือข่าย** สำหรับปริมาณการใช้งานที่คาดการณ์
- **การปรับให้เหมาะสมด้านค่าใช้จ่าย** ผ่านการจัดขนาดที่ถูกต้อง

## 📊 การทำความเข้าใจโควต้าและขีดจำกัดของ Azure

### ประเภทของขีดจำกัด
1. **โควต้าระดับการสมัครใช้งาน** - จำนวนทรัพยากรสูงสุดต่อการสมัครใช้งาน
2. **โควต้าตามภูมิภาค** - จำนวนทรัพยากรสูงสุดต่อภูมิภาค
3. **ขีดจำกัดเฉพาะทรัพยากร** - ขีดจำกัดสำหรับประเภททรัพยากรแต่ละชนิด
4. **ขีดจำกัดระดับบริการ** - ขีดจำกัดตามแผนบริการของคุณ

### โควต้าทรัพยากรทั่วไป
```bash
# ตรวจสอบการใช้งานโควตาปัจจุบัน
az vm list-usage --location eastus2 --output table

# ตรวจสอบโควตาของทรัพยากรเฉพาะ
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## การตรวจสอบความจุก่อนการปรับใช้

### สคริปต์การตรวจสอบความจอัตโนมัติ
```bash
#!/bin/bash
# capacity-check.sh - ตรวจสอบความจุของ Azure ก่อนการปรับใช้

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# ฟังก์ชันเพื่อตรวจสอบการใช้โควต้า
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

# ตรวจสอบโควต้าทรัพยากรต่าง ๆ
check_quota "compute" 4      # ต้องการ vCPU 4 ตัว
check_quota "storage" 2      # ต้องการ 2 บัญชี storage
check_quota "network" 1      # ต้องการเครือข่ายเสมือน 1 อัน

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### การตรวจสอบความจุเฉพาะบริการ

#### ความจุของ App Service
```bash
# ตรวจสอบความพร้อมใช้งานของ App Service Plan
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # ตรวจสอบ SKU ที่มีอยู่ในภูมิภาค
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # แนะนำภูมิภาคทางเลือก
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # ตรวจสอบการใช้งานปัจจุบัน
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# การใช้งาน
check_app_service_capacity "eastus2" "P1v3"
```

#### ความจุของฐานข้อมูล
```bash
# ตรวจสอบความจุของ PostgreSQL
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # ตรวจสอบว่า SKU พร้อมใช้งานหรือไม่
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # แสดง SKU ที่พร้อมใช้งาน
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# ตรวจสอบความจุของ Cosmos DB
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # ตรวจสอบความพร้อมใช้งานของภูมิภาค
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # ตรวจสอบว่า serverless ได้รับการสนับสนุนหรือไม่ (ถ้าจำเป็น)
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

#### ความจุของ Container Apps
```bash
# ตรวจสอบความจุของ Container Apps
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # ตรวจสอบว่า Container Apps พร้อมใช้งานในภูมิภาคหรือไม่
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # ตรวจสอบจำนวนสภาพแวดล้อมปัจจุบัน
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Apps จำกัดไว้ที่ 15 สภาพแวดล้อมต่อภูมิภาค
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # แสดงภูมิภาคที่มีให้บริการ
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 การตรวจสอบความพร้อมใช้งานตามภูมิภาค

### ความพร้อมของบริการตามภูมิภาค
```bash
# ตรวจสอบความพร้อมในการให้บริการในแต่ละภูมิภาค
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

# ตรวจสอบบริการทั้งหมด
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### คำแนะนำการเลือกภูมิภาค
```bash
# แนะนำภูมิภาคที่เหมาะสมตามข้อกำหนด
recommend_region() {
    local requirements=$1  # "ต้นทุนต่ำ" | "ประสิทธิภาพ" | "การปฏิบัติตามข้อกำหนด"
    
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

## 💰 การวางแผนและการประมาณค่าใช้จ่าย

### การประมาณค่าใช้จ่ายของทรัพยากร
```bash
# ประเมินค่าใช้จ่ายในการปรับใช้
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # สร้างกลุ่มทรัพยากรชั่วคราวสำหรับการประมาณการ
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # ปรับใช้โครงสร้างพื้นฐานในโหมดตรวจสอบ
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # ลบกลุ่มทรัพยากรชั่วคราว
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### คำแนะนำการปรับแต่ง SKU
```bash
# แนะนำ SKU ที่เหมาะสมตามข้อกำหนด
recommend_sku() {
    local service=$1
    local workload_type=$2  # "การพัฒนา" | "สเตจ" | "การใช้งานจริง"
    
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

## 🚀 การตรวจสอบก่อนการปรับใช้แบบอัตโนมัติ

### สคริปต์ Pre-Flight แบบครอบคลุม
```bash
#!/bin/bash
# preflight-check.sh - การตรวจสอบก่อนการปรับใช้แบบสมบูรณ์

set -e

# การกำหนดค่า
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# สีสำหรับการแสดงผล
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # ไม่มีสี

# ฟังก์ชันการบันทึก
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# โหลดการกำหนดค่า
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

# การตรวจสอบ 1: การพิสูจน์ตัวตน
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# การตรวจสอบ 2: ความพร้อมใช้งานตามภูมิภาค
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# การตรวจสอบ 3: การยืนยันโควต้า
log_info "Checking quota availability..."

# โควต้าของ vCPU
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

# โควต้าบัญชีจัดเก็บข้อมูล
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

# การตรวจสอบ 4: ความพร้อมให้บริการ
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

# การตรวจสอบ 5: ความจุเครือข่าย
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

# การตรวจสอบ 6: การยืนยันการตั้งชื่อทรัพยากร
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# การตรวจสอบ 7: การประมาณค่าใช้จ่าย
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

# การตรวจสอบ 8: การยืนยันเทมเพลต
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

# สรุปสุดท้าย
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### เทมเพลตไฟล์การกำหนดค่า
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

## 📈 การมอนิเตอร์ความจุระหว่างการปรับใช้

### การมอนิเตอร์ความจุแบบเรียลไทม์
```bash
# ติดตามความจุระหว่างการปรับใช้
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # ตรวจสอบสถานะการปรับใช้
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
        
        # ตรวจสอบการใช้ทรัพยากรปัจจุบัน
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 การผสานรวมกับ AZD

### เพิ่ม Pre-Flight Hooks ไปยัง azure.yaml
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

## แนวปฏิบัติที่ดีที่สุด

1. **เรียกใช้การตรวจสอบความจาเสมอ** ก่อนปรับใช้ในภูมิภาคใหม่
2. **มอนิเตอร์การใช้งานโควต้าเป็นประจำ** เพื่อหลีกเลี่ยงปัญหาไม่คาดคิด
3. **วางแผนการเติบโต** โดยตรวจสอบความต้องการความจุในอนาคต
4. **ใช้เครื่องมือประมาณค่าใช้จ่าย** เพื่อหลีกเลี่ยงบิลที่สูงกะทันหัน
5. **จัดทำเอกสารความต้องการความจุ** สำหรับทีมของคุณ
6. **ทำการตรวจสอบความจาโดยอัตโนมัติ** ใน CI/CD pipelines
7. **พิจารณาความต้องการความจุสำหรับการสลับสำรองตามภูมิภาค** 

## ขั้นตอนถัดไป

- [คู่มือการเลือก SKU](sku-selection.md) - เลือกระดับบริการที่เหมาะสม
- [การตรวจสอบก่อนบิน](preflight-checks.md) - สคริปต์การตรวจสอบอัตโนมัติ
- [ชีตสรุป](../../resources/cheat-sheet.md) - คำสั่งอ้างอิงด่วน
- [พจนานุกรมคำศัพท์](../../resources/glossary.md) - คำและคำนิยาม

## แหล่งข้อมูลเพิ่มเติม

- [ข้อจำกัดการสมัครใช้บริการ Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [ตัวคำนวณราคา Azure](https://azure.microsoft.com/pricing/calculator/)
- [การจัดการค่าใช้จ่ายของ Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [ความพร้อมใช้งานตามภูมิภาคของ Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [คู่มือการดีบัก](../chapter-07-troubleshooting/debugging.md)

- **บทเรียนถัดไป**: [การเลือก SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ข้อจำกัดความรับผิดชอบ:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลด้วย AI Co-op Translator (https://github.com/Azure/co-op-translator). แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่แม่นยำ เอกสารต้นฉบับในภาษาต้นฉบับควรถือเป็นแหล่งข้อมูลที่มีอำนาจชี้ขาด สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้การแปลโดยนักแปลมืออาชีพที่เป็นมนุษย์ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->