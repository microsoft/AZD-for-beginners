<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "133c6f0d02c698cbe1cdb5d405ad4994",
  "translation_date": "2025-11-21T07:34:51+00:00",
  "source_file": "docs/pre-deployment/capacity-planning.md",
  "language_code": "th"
}
-->
# การวางแผนความจุ - ความพร้อมใช้งานและข้อจำกัดของทรัพยากร Azure

**การนำทางบทเรียน:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทเรียนปัจจุบัน**: บทที่ 6 - การตรวจสอบและวางแผนก่อนการปรับใช้
- **⬅️ บทก่อนหน้า**: [บทที่ 5: โซลูชัน AI หลายตัวแทน](../../examples/retail-scenario.md)
- **➡️ ถัดไป**: [การเลือก SKU](sku-selection.md)
- **🚀 บทถัดไป**: [บทที่ 7: การแก้ไขปัญหา](../troubleshooting/common-issues.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้ช่วยให้คุณวางแผนและตรวจสอบความจุของทรัพยากร Azure ก่อนการปรับใช้ด้วย Azure Developer CLI เรียนรู้การประเมินโควต้า ความพร้อมใช้งาน และข้อจำกัดในแต่ละภูมิภาคเพื่อให้การปรับใช้สำเร็จ พร้อมทั้งเพิ่มประสิทธิภาพด้านต้นทุนและการทำงาน เชี่ยวชาญเทคนิคการวางแผนความจุสำหรับสถาปัตยกรรมแอปพลิเคชันและสถานการณ์การปรับขนาดที่หลากหลาย

## เป้าหมายการเรียนรู้

เมื่อจบคู่มือนี้ คุณจะ:
- เข้าใจโควต้า ข้อจำกัด และข้อจำกัดด้านความพร้อมใช้งานในแต่ละภูมิภาคของ Azure
- เชี่ยวชาญเทคนิคการตรวจสอบความพร้อมใช้งานและความจุของทรัพยากรก่อนการปรับใช้
- ใช้กลยุทธ์การตรวจสอบและการติดตามความจุแบบอัตโนมัติ
- ออกแบบแอปพลิเคชันด้วยการกำหนดขนาดทรัพยากรและการปรับขนาดที่เหมาะสม
- ใช้กลยุทธ์การเพิ่มประสิทธิภาพต้นทุนผ่านการวางแผนความจุอย่างชาญฉลาด
- ตั้งค่าการแจ้งเตือนและการติดตามการใช้งานโควต้าและความพร้อมใช้งานของทรัพยากร

## ผลลัพธ์การเรียนรู้

เมื่อจบคู่มือนี้ คุณจะสามารถ:
- ประเมินและตรวจสอบความต้องการความจุของทรัพยากร Azure ก่อนการปรับใช้
- สร้างสคริปต์อัตโนมัติสำหรับการตรวจสอบความจุและการติดตามโควต้า
- ออกแบบสถาปัตยกรรมที่สามารถปรับขนาดได้โดยคำนึงถึงข้อจำกัดในแต่ละภูมิภาคและการสมัครสมาชิก
- ใช้กลยุทธ์การกำหนดขนาดทรัพยากรที่คุ้มค่าสำหรับประเภทงานที่หลากหลาย
- ตั้งค่าการติดตามและการแจ้งเตือนเชิงรุกสำหรับปัญหาที่เกี่ยวข้องกับความจุ
- วางแผนการปรับใช้ในหลายภูมิภาคด้วยการกระจายความจุที่เหมาะสม

## ทำไมการวางแผนความจุถึงสำคัญ

ก่อนการปรับใช้แอปพลิเคชัน คุณจำเป็นต้องมั่นใจว่า:
- **โควต้าที่เพียงพอ** สำหรับทรัพยากรที่ต้องการ
- **ความพร้อมใช้งานของทรัพยากร** ในภูมิภาคเป้าหมายของคุณ
- **ความพร้อมใช้งานของระดับบริการ** สำหรับประเภทการสมัครสมาชิกของคุณ
- **ความจุเครือข่าย** สำหรับปริมาณการใช้งานที่คาดการณ์ไว้
- **การเพิ่มประสิทธิภาพต้นทุน** ผ่านการกำหนดขนาดที่เหมาะสม

## 📊 การทำความเข้าใจโควต้าและข้อจำกัดของ Azure

### ประเภทของข้อจำกัด
1. **โควต้าระดับการสมัครสมาชิก** - ทรัพยากรสูงสุดต่อการสมัครสมาชิก
2. **โควต้าระดับภูมิภาค** - ทรัพยากรสูงสุดต่อภูมิภาค
3. **ข้อจำกัดเฉพาะทรัพยากร** - ข้อจำกัดสำหรับประเภททรัพยากรแต่ละประเภท
4. **ข้อจำกัดระดับบริการ** - ข้อจำกัดตามแผนบริการของคุณ

### โควต้าทรัพยากรทั่วไป
```bash
# ตรวจสอบการใช้งานโควตาปัจจุบัน
az vm list-usage --location eastus2 --output table

# ตรวจสอบโควตาทรัพยากรเฉพาะ
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## การตรวจสอบความจุก่อนการปรับใช้

### สคริปต์ตรวจสอบความจุแบบอัตโนมัติ
```bash
#!/bin/bash
# capacity-check.sh - ตรวจสอบความจุของ Azure ก่อนการปรับใช้

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# ฟังก์ชันเพื่อตรวจสอบการใช้งานโควตา
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

# ตรวจสอบโควตาทรัพยากรต่างๆ
check_quota "compute" 4      # ต้องการ 4 vCPUs
check_quota "storage" 2      # ต้องการ 2 บัญชีจัดเก็บข้อมูล
check_quota "network" 1      # ต้องการ 1 เครือข่ายเสมือน

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### การตรวจสอบความจุเฉพาะบริการ

#### ความจุของ App Service
```bash
# ตรวจสอบความพร้อมใช้งานของแผนบริการแอป
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
    
    # ตรวจสอบว่า SKU มีอยู่หรือไม่
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # แสดง SKU ที่มีอยู่
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
        
        # ตรวจสอบว่ารองรับ serverless หรือไม่ (ถ้าจำเป็น)
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
        
        # Container Apps มีข้อจำกัดที่ 15 สภาพแวดล้อมต่อภูมิภาค
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # แสดงภูมิภาคที่พร้อมใช้งาน
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 การตรวจสอบความพร้อมใช้งานในแต่ละภูมิภาค

### ความพร้อมใช้งานของบริการในแต่ละภูมิภาค
```bash
# ตรวจสอบความพร้อมใช้งานของบริการในแต่ละภูมิภาค
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
# แนะนำภูมิภาคที่เหมาะสมที่สุดตามความต้องการ
recommend_region() {
    local requirements=$1  # "ราคาต่ำ" | "ประสิทธิภาพ" | "การปฏิบัติตามข้อกำหนด"
    
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

## 💰 การวางแผนและการประมาณต้นทุน

### การประมาณต้นทุนทรัพยากร
```bash
# ประเมินค่าใช้จ่ายในการปรับใช้
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # สร้างกลุ่มทรัพยากรชั่วคราวสำหรับการประเมิน
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # ปรับใช้โครงสร้างพื้นฐานในโหมดการตรวจสอบ
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # ล้างกลุ่มทรัพยากรชั่วคราว
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### คำแนะนำการเพิ่มประสิทธิภาพ SKU
```bash
# แนะนำ SKU ที่เหมาะสมที่สุดตามความต้องการ
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

## 🚀 การตรวจสอบก่อนการปรับใช้อัตโนมัติ

### สคริปต์ตรวจสอบก่อนการปรับใช้อย่างครอบคลุม
```bash
#!/bin/bash
# preflight-check.sh - การตรวจสอบก่อนการปรับใช้เสร็จสมบูรณ์

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

# การตรวจสอบ 1: การตรวจสอบสิทธิ์
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# การตรวจสอบ 2: ความพร้อมใช้งานในภูมิภาค
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# การตรวจสอบ 3: การตรวจสอบโควตา
log_info "Checking quota availability..."

# โควตา vCPU
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

# โควตาบัญชีจัดเก็บข้อมูล
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

# การตรวจสอบ 4: ความพร้อมใช้งานของบริการ
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

# การตรวจสอบ 6: การตรวจสอบการตั้งชื่อทรัพยากร
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

# การตรวจสอบ 8: การตรวจสอบเทมเพลต
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

### แม่แบบไฟล์การตั้งค่า
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

## 📈 การติดตามความจุระหว่างการปรับใช้

### การติดตามความจุแบบเรียลไทม์
```bash
# ตรวจสอบความจุระหว่างการปรับใช้
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
        
        # ตรวจสอบการใช้งานทรัพยากรปัจจุบัน
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 การรวมเข้ากับ AZD

### เพิ่ม Hooks การตรวจสอบก่อนการปรับใช้ใน azure.yaml
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

## แนวทางปฏิบัติที่ดีที่สุด

1. **ตรวจสอบความจุเสมอ** ก่อนการปรับใช้ในภูมิภาคใหม่
2. **ติดตามการใช้งานโควต้าเป็นประจำ** เพื่อหลีกเลี่ยงปัญหา
3. **วางแผนสำหรับการเติบโต** โดยตรวจสอบความต้องการความจุในอนาคต
4. **ใช้เครื่องมือประมาณต้นทุน** เพื่อหลีกเลี่ยงค่าใช้จ่ายที่ไม่คาดคิด
5. **บันทึกความต้องการความจุ** สำหรับทีมของคุณ
6. **ทำให้การตรวจสอบความจุเป็นอัตโนมัติ** ใน CI/CD pipelines
7. **พิจารณาความต้องการความจุสำหรับการสำรองข้อมูลในภูมิภาค**

## ขั้นตอนถัดไป

- [คู่มือการเลือก SKU](sku-selection.md) - เลือกระดับบริการที่เหมาะสม
- [การตรวจสอบก่อนการปรับใช้](preflight-checks.md) - สคริปต์การตรวจสอบอัตโนมัติ
- [Cheat Sheet](../../resources/cheat-sheet.md) - คำสั่งอ้างอิงด่วน
- [คำศัพท์](../../resources/glossary.md) - คำศัพท์และคำจำกัดความ

## แหล่งข้อมูลเพิ่มเติม

- [ข้อจำกัดการสมัครสมาชิก Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [เครื่องมือคำนวณราคา Azure](https://azure.microsoft.com/pricing/calculator/)
- [การจัดการต้นทุน Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [ความพร้อมใช้งานในแต่ละภูมิภาคของ Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [คู่มือการแก้ไขข้อบกพร่อง](../troubleshooting/debugging.md)

- **บทเรียนถัดไป**: [การเลือก SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามนุษย์ที่มีความเชี่ยวชาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->