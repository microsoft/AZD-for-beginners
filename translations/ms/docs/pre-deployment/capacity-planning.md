<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "133c6f0d02c698cbe1cdb5d405ad4994",
  "translation_date": "2025-11-22T09:35:38+00:00",
  "source_file": "docs/pre-deployment/capacity-planning.md",
  "language_code": "ms"
}
-->
# Perancangan Kapasiti - Ketersediaan dan Had Sumber Azure

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 6 - Pengesahan & Perancangan Pra-Pelaksanaan
- **⬅️ Bab Sebelumnya**: [Bab 5: Penyelesaian AI Multi-Ejen](../../examples/retail-scenario.md)
- **➡️ Seterusnya**: [Pemilihan SKU](sku-selection.md)
- **🚀 Bab Seterusnya**: [Bab 7: Penyelesaian Masalah](../troubleshooting/common-issues.md)

## Pengenalan

Panduan komprehensif ini membantu anda merancang dan mengesahkan kapasiti sumber Azure sebelum melaksanakan dengan Azure Developer CLI. Pelajari cara menilai kuota, ketersediaan, dan batasan wilayah untuk memastikan pelaksanaan berjaya sambil mengoptimumkan kos dan prestasi. Kuasai teknik perancangan kapasiti untuk pelbagai seni bina aplikasi dan senario penskalaan.

## Matlamat Pembelajaran

Dengan melengkapkan panduan ini, anda akan:
- Memahami kuota Azure, had, dan kekangan ketersediaan wilayah
- Menguasai teknik untuk memeriksa ketersediaan dan kapasiti sumber sebelum pelaksanaan
- Melaksanakan strategi pengesahan kapasiti dan pemantauan automatik
- Merancang aplikasi dengan saiz sumber dan pertimbangan penskalaan yang sesuai
- Mengaplikasikan strategi pengoptimuman kos melalui perancangan kapasiti yang bijak
- Mengkonfigurasi amaran dan pemantauan untuk penggunaan kuota dan ketersediaan sumber

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Menilai dan mengesahkan keperluan kapasiti sumber Azure sebelum pelaksanaan
- Membuat skrip automatik untuk pemeriksaan kapasiti dan pemantauan kuota
- Merancang seni bina yang boleh diskalakan dengan mengambil kira had wilayah dan langganan
- Melaksanakan strategi saiz sumber yang menjimatkan kos untuk pelbagai jenis beban kerja
- Mengkonfigurasi pemantauan proaktif dan amaran untuk isu berkaitan kapasiti
- Merancang pelaksanaan pelbagai wilayah dengan pengagihan kapasiti yang sesuai

## Mengapa Perancangan Kapasiti Penting

Sebelum melaksanakan aplikasi, anda perlu memastikan:
- **Kuota mencukupi** untuk sumber yang diperlukan
- **Ketersediaan sumber** di wilayah sasaran anda
- **Ketersediaan tahap perkhidmatan** untuk jenis langganan anda
- **Kapasiti rangkaian** untuk trafik yang dijangkakan
- **Pengoptimuman kos** melalui saiz yang sesuai

## 📊 Memahami Kuota dan Had Azure

### Jenis Had
1. **Kuota peringkat langganan** - Sumber maksimum setiap langganan
2. **Kuota wilayah** - Sumber maksimum setiap wilayah
3. **Had khusus sumber** - Had untuk jenis sumber individu
4. **Had tahap perkhidmatan** - Had berdasarkan pelan perkhidmatan anda

### Kuota Sumber Biasa
```bash
# Semak penggunaan kuota semasa
az vm list-usage --location eastus2 --output table

# Semak kuota sumber tertentu
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Pemeriksaan Kapasiti Pra-Pelaksanaan

### Skrip Pengesahan Kapasiti Automatik
```bash
#!/bin/bash
# capacity-check.sh - Sahkan kapasiti Azure sebelum penyebaran

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Fungsi untuk memeriksa penggunaan kuota
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

# Periksa pelbagai kuota sumber
check_quota "compute" 4      # Memerlukan 4 vCPU
check_quota "storage" 2      # Memerlukan 2 akaun storan
check_quota "network" 1      # Memerlukan 1 rangkaian maya

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Pemeriksaan Kapasiti Khusus Perkhidmatan

#### Kapasiti App Service
```bash
# Periksa ketersediaan Pelan Perkhidmatan Aplikasi
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Periksa SKU yang tersedia di rantau
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Cadangkan rantau alternatif
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Periksa penggunaan semasa
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Penggunaan
check_app_service_capacity "eastus2" "P1v3"
```

#### Kapasiti Pangkalan Data
```bash
# Periksa kapasiti PostgreSQL
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # Periksa jika SKU tersedia
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Paparkan SKU yang tersedia
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Periksa kapasiti Cosmos DB
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Periksa ketersediaan wilayah
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Periksa jika serverless disokong (jika diperlukan)
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

#### Kapasiti Container Apps
```bash
# Periksa kapasiti Aplikasi Kontena
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Periksa jika Aplikasi Kontena tersedia di rantau
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Periksa jumlah persekitaran semasa
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Aplikasi Kontena mempunyai had 15 persekitaran setiap rantau
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Paparkan rantau yang tersedia
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Pengesahan Ketersediaan Wilayah

### Ketersediaan Perkhidmatan Mengikut Wilayah
```bash
# Periksa ketersediaan perkhidmatan di seluruh wilayah
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

# Periksa semua perkhidmatan
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Cadangan Pemilihan Wilayah
```bash
# Cadangkan kawasan optimum berdasarkan keperluan
recommend_region() {
    local requirements=$1  # "kosrendah" | "prestasi" | "pematuhan"
    
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

## 💰 Perancangan dan Anggaran Kos

### Anggaran Kos Sumber
```bash
# Anggarkan kos pelaksanaan
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Buat kumpulan sumber sementara untuk anggaran
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Laksanakan infrastruktur dalam mod pengesahan
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Bersihkan kumpulan sumber sementara
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### Cadangan Pengoptimuman SKU
```bash
# Cadangkan SKU yang optimum berdasarkan keperluan
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

## 🚀 Pemeriksaan Pra-Pelaksanaan Automatik

### Skrip Pra-Pelaksanaan Komprehensif
```bash
#!/bin/bash
# preflight-check.sh - Pengesahan pra-pelaksanaan lengkap

set -e

# Konfigurasi
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Warna untuk output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Tiada Warna

# Fungsi log
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Muat konfigurasi
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

# Semakan 1: Pengesahan
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Semakan 2: Ketersediaan wilayah
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Semakan 3: Pengesahan kuota
log_info "Checking quota availability..."

# Kuota vCPU
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

# Kuota akaun storan
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

# Semakan 4: Ketersediaan perkhidmatan
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

# Semakan 5: Kapasiti rangkaian
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

# Semakan 6: Pengesahan penamaan sumber
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Semakan 7: Anggaran kos
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

# Semakan 8: Pengesahan templat
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

# Ringkasan akhir
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Templat Fail Konfigurasi
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

## 📈 Pemantauan Kapasiti Semasa Pelaksanaan

### Pemantauan Kapasiti Masa Nyata
```bash
# Pantau kapasiti semasa pelaksanaan
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Periksa status pelaksanaan
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
        
        # Periksa penggunaan sumber semasa
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 Integrasi dengan AZD

### Tambahkan Hooks Pra-Pelaksanaan ke azure.yaml
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

## Amalan Terbaik

1. **Sentiasa jalankan pemeriksaan kapasiti** sebelum melaksanakan ke wilayah baru
2. **Pantau penggunaan kuota secara berkala** untuk mengelakkan kejutan
3. **Rancang untuk pertumbuhan** dengan memeriksa keperluan kapasiti masa depan
4. **Gunakan alat anggaran kos** untuk mengelakkan kejutan bil
5. **Dokumentasikan keperluan kapasiti** untuk pasukan anda
6. **Automasi pengesahan kapasiti** dalam pipeline CI/CD
7. **Pertimbangkan keperluan kapasiti failover wilayah**

## Langkah Seterusnya

- [Panduan Pemilihan SKU](sku-selection.md) - Pilih tahap perkhidmatan yang optimum
- [Pemeriksaan Pra-Pelaksanaan](preflight-checks.md) - Skrip pengesahan automatik
- [Cheat Sheet](../../resources/cheat-sheet.md) - Perintah rujukan pantas
- [Glosari](../../resources/glossary.md) - Istilah dan definisi

## Sumber Tambahan

- [Had Langganan Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/)
- [Pengurusan Kos Azure](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Ketersediaan Wilayah Azure](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Debugging](../troubleshooting/debugging.md)

- **Pelajaran Seterusnya**: [Pemilihan SKU](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->