# Kapasite Planlama - Azure Kaynak Kullanılabilirliği ve Limitler

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 6 - Dağıtım Öncesi Doğrulama ve Planlama
- **⬅️ Önceki Bölüm**: [Bölüm 5: Çoklu Ajanlı Yapay Zeka Çözümleri](../../examples/retail-scenario.md)
- **➡️ Sonraki**: [SKU Seçimi](sku-selection.md)
- **🚀 Sonraki Bölüm**: [Bölüm 7: Sorun Giderme](../troubleshooting/common-issues.md)

## Giriş

Bu kapsamlı rehber, Azure Developer CLI ile dağıtımdan önce Azure kaynak kapasitesini planlamanıza ve doğrulamanıza yardımcı olur. Kotaları, kullanılabilirliği ve bölgesel sınırlamaları değerlendirerek başarılı dağıtımlar yapmayı, maliyetleri optimize etmeyi ve performansı artırmayı öğrenin. Farklı uygulama mimarileri ve ölçeklendirme senaryoları için kapasite planlama tekniklerini ustalıkla kullanın.

## Öğrenme Hedefleri

Bu rehberi tamamladığınızda:
- Azure kotalarını, limitlerini ve bölgesel kullanılabilirlik kısıtlamalarını anlayacaksınız
- Dağıtımdan önce kaynak kullanılabilirliği ve kapasitesini kontrol etme tekniklerini öğreneceksiniz
- Otomatik kapasite doğrulama ve izleme stratejilerini uygulayacaksınız
- Uygulamaları doğru kaynak boyutlandırma ve ölçeklendirme ile tasarlayacaksınız
- Akıllı kapasite planlama ile maliyet optimizasyon stratejilerini uygulayacaksınız
- Kota kullanımı ve kaynak kullanılabilirliği için uyarılar ve izleme yapılandıracaksınız

## Öğrenme Çıktıları

Tamamlandığında, şunları yapabileceksiniz:
- Dağıtımdan önce Azure kaynak kapasite gereksinimlerini değerlendirin ve doğrulayın
- Kapasite kontrolü ve kota izleme için otomatik scriptler oluşturun
- Bölgesel ve abonelik limitlerini dikkate alan ölçeklenebilir mimariler tasarlayın
- Farklı iş yükü türleri için maliyet etkin kaynak boyutlandırma stratejileri uygulayın
- Kapasiteyle ilgili sorunlar için proaktif izleme ve uyarı yapılandırın
- Doğru kapasite dağılımıyla çok bölgeli dağıtımlar planlayın

## Kapasite Planlaması Neden Önemlidir?

Uygulamaları dağıtmadan önce şunları sağlamanız gerekir:
- Gerekli kaynaklar için **yeterli kotalar**
- Hedef bölgenizde **kaynak kullanılabilirliği**
- Abonelik türünüz için **hizmet katmanı kullanılabilirliği**
- Beklenen trafik için **ağ kapasitesi**
- Doğru boyutlandırma ile **maliyet optimizasyonu**

## 📊 Azure Kotaları ve Limitlerini Anlama

### Limit Türleri
1. **Abonelik seviyesinde kotalar** - Abonelik başına maksimum kaynaklar
2. **Bölgesel kotalar** - Bölge başına maksimum kaynaklar
3. **Kaynak özel limitler** - Bireysel kaynak türleri için limitler
4. **Hizmet katmanı limitleri** - Hizmet planınıza bağlı limitler

### Yaygın Kaynak Kotaları
```bash
# Mevcut kota kullanımını kontrol et
az vm list-usage --location eastus2 --output table

# Belirli kaynak kotalarını kontrol et
az network list-usages --location eastus2 --output table
az storage account show-usage --output table
```

## Dağıtım Öncesi Kapasite Kontrolleri

### Otomatik Kapasite Doğrulama Scripti
```bash
#!/bin/bash
# capacity-check.sh - Azure kapasitesini dağıtımdan önce doğrula

set -e

LOCATION=${1:-eastus2}
SUBSCRIPTION_ID=$(az account show --query id -o tsv)

echo "Checking Azure capacity for location: $LOCATION"
echo "Subscription: $SUBSCRIPTION_ID"
echo "======================================================"

# Kota kullanımını kontrol etme fonksiyonu
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

# Çeşitli kaynak kotalarını kontrol et
check_quota "compute" 4      # 4 vCPU gerekiyor
check_quota "storage" 2      # 2 depolama hesabı gerekiyor
check_quota "network" 1      # 1 sanal ağ gerekiyor

echo "======================================================"
echo "✅ Capacity check completed successfully!"
```

### Hizmet Özelinde Kapasite Kontrolleri

#### Uygulama Hizmeti Kapasitesi
```bash
# Uygulama Hizmet Planı kullanılabilirliğini kontrol et
check_app_service_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking App Service Plan capacity for $sku in $location"
    
    # Bölgedeki mevcut SKU'ları kontrol et
    available_skus=$(az appservice list-locations --sku "$sku" --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_skus" ]; then
        echo "✅ $sku is available in $location"
    else
        echo "❌ $sku is not available in $location"
        
        # Alternatif bölgeler öner
        echo "Available regions for $sku:"
        az appservice list-locations --sku "$sku" --query "[].name" -o table
        return 1
    fi
    
    # Mevcut kullanımı kontrol et
    current_plans=$(az appservice plan list --query "length([?location=='$location' && sku.name=='$sku'])")
    echo "Current $sku plans in $location: $current_plans"
}

# Kullanım
check_app_service_capacity "eastus2" "P1v3"
```

#### Veritabanı Kapasitesi
```bash
# PostgreSQL kapasitesini kontrol et
check_postgres_capacity() {
    local location=$1
    local sku=$2
    
    echo "Checking PostgreSQL capacity for $sku in $location"
    
    # SKU'nun mevcut olup olmadığını kontrol et
    available=$(az postgres flexible-server list-skus --location "$location" \
        --query "contains([].name, '$sku')" -o tsv)
    
    if [ "$available" = "true" ]; then
        echo "✅ PostgreSQL $sku is available in $location"
    else
        echo "❌ PostgreSQL $sku is not available in $location"
        
        # Mevcut SKU'ları göster
        echo "Available PostgreSQL SKUs in $location:"
        az postgres flexible-server list-skus --location "$location" \
            --query "[].{name:name,tier:tier,vCores:vCores,memory:memorySizeInMb}" -o table
        return 1
    fi
}

# Cosmos DB kapasitesini kontrol et
check_cosmos_capacity() {
    local location=$1
    local tier=$2
    
    echo "Checking Cosmos DB capacity in $location"
    
    # Bölge uygunluğunu kontrol et
    available_regions=$(az cosmosdb locations list --query "[?name=='$location']" -o tsv)
    
    if [ -n "$available_regions" ]; then
        echo "✅ Cosmos DB is available in $location"
        
        # Sunucusuz desteğinin olup olmadığını kontrol et (gerekirse)
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

#### Container Uygulamaları Kapasitesi
```bash
# Container Uygulamaları kapasitesini kontrol et
check_container_apps_capacity() {
    local location=$1
    
    echo "Checking Container Apps capacity in $location"
    
    # Container Uygulamaları'nın bölgede mevcut olup olmadığını kontrol et
    az provider show --namespace Microsoft.App \
        --query "resourceTypes[?resourceType=='containerApps'].locations" \
        --output table | grep -q "$location"
    
    if [ $? -eq 0 ]; then
        echo "✅ Container Apps is available in $location"
        
        # Mevcut ortam sayısını kontrol et
        current_envs=$(az containerapp env list \
            --query "length([?location=='$location'])")
        
        echo "Current Container App environments in $location: $current_envs"
        
        # Container Uygulamaları'nın her bölge için 15 ortam sınırı vardır
        if [ "$current_envs" -lt 15 ]; then
            echo "✅ Can create more Container App environments"
        else
            echo "⚠️  Near Container App environment limit in $location"
        fi
    else
        echo "❌ Container Apps is not available in $location"
        
        # Mevcut bölgeleri göster
        echo "Available regions for Container Apps:"
        az provider show --namespace Microsoft.App \
            --query "resourceTypes[?resourceType=='containerApps'].locations[0:10]" \
            --output table
        return 1
    fi
}
```

## 📍 Bölgesel Kullanılabilirlik Doğrulaması

### Bölgeye Göre Hizmet Kullanılabilirliği
```bash
# Bölgeler arasında hizmet kullanılabilirliğini kontrol et
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

# Tüm hizmetleri kontrol et
for service in appservice containerapp postgres cosmosdb; do
    check_service_availability "$service"
    echo ""
done
```

### Bölge Seçimi Önerileri
```bash
# Gereksinimlere göre en uygun bölgeleri öner
recommend_region() {
    local requirements=$1  # "düşük maliyet" | "performans" | "uyumluluk"
    
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

## 💰 Maliyet Planlama ve Tahmin

### Kaynak Maliyet Tahmini
```bash
# Dağıtım maliyetlerini tahmin et
estimate_costs() {
    local resource_group=$1
    local location=$2
    
    echo "Estimating costs for deployment in $location"
    
    # Tahmin için geçici bir kaynak grubu oluştur
    temp_rg="temp-estimation-$(date +%s)"
    az group create --name "$temp_rg" --location "$location" >/dev/null
    
    # Altyapıyı doğrulama modunda dağıt
    az deployment group validate \
        --resource-group "$temp_rg" \
        --template-file infra/main.bicep \
        --parameters @infra/main.parameters.json \
        --parameters location="$location" \
        --query "properties.validatedResources[].{type:type,name:name}" -o table
    
    # Geçici kaynak grubunu temizle
    az group delete --name "$temp_rg" --yes --no-wait
    
    echo ""
    echo "💡 Use Azure Pricing Calculator for detailed cost estimates:"
    echo "   https://azure.microsoft.com/pricing/calculator/"
    echo ""
    echo "💡 Consider using Azure Cost Management for ongoing monitoring:"
    echo "   https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/overview"
}
```

### SKU Optimizasyon Önerileri
```bash
# Gereksinimlere göre en uygun SKU'ları öner
recommend_sku() {
    local service=$1
    local workload_type=$2  # "geliştirme" | "test" | "üretim"
    
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

## 🚀 Otomatik Dağıtım Öncesi Kontroller

### Kapsamlı Dağıtım Öncesi Script
```bash
#!/bin/bash
# preflight-check.sh - Dağıtım öncesi doğrulama tamamlandı

set -e

# Yapılandırma
LOCATION=${1:-eastus2}
ENVIRONMENT=${2:-dev}
CONFIG_FILE="preflight-config.json"

# Çıktı için renkler
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Renk Yok

# Günlükleme işlevleri
log_info() { echo -e "${GREEN}ℹ️  $1${NC}"; }
log_warn() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Yapılandırmayı yükle
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

# Kontrol 1: Kimlik doğrulama
log_info "Checking Azure authentication..."
if az account show >/dev/null 2>&1; then
    SUBSCRIPTION_NAME=$(az account show --query name -o tsv)
    log_info "Authenticated with subscription: $SUBSCRIPTION_NAME"
else
    log_error "Not authenticated with Azure. Run 'az login' first."
    exit 1
fi

# Kontrol 2: Bölgesel kullanılabilirlik
log_info "Checking regional availability..."
if az account list-locations --query "[?name=='$LOCATION']" | grep -q "$LOCATION"; then
    log_info "Region $LOCATION is available"
else
    log_error "Region $LOCATION is not available"
    exit 1
fi

# Kontrol 3: Kota doğrulama
log_info "Checking quota availability..."

# vCPU kotası
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

# Depolama hesabı kotası
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

# Kontrol 4: Hizmet kullanılabilirliği
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

# Kontrol 5: Ağ kapasitesi
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

# Kontrol 6: Kaynak adlandırma doğrulaması
log_info "Checking resource naming conventions..."
RESOURCE_TOKEN=$(echo -n "${SUBSCRIPTION_ID}${ENVIRONMENT}${LOCATION}" | sha256sum | cut -c1-8)
STORAGE_NAME="myapp${ENVIRONMENT}sa${RESOURCE_TOKEN}"

if [ ${#STORAGE_NAME} -le 24 ] && [[ "$STORAGE_NAME" =~ ^[a-z0-9]+$ ]]; then
    log_info "Storage account naming is valid: $STORAGE_NAME"
else
    log_error "Storage account naming is invalid: $STORAGE_NAME"
    exit 1
fi

# Kontrol 7: Maliyet tahmini
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

# Kontrol 8: Şablon doğrulama
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

# Son özet
echo "=================================="
log_info "✅ All pre-flight checks passed!"
log_info "Ready for deployment to $LOCATION"
echo "Next steps:"
echo "  1. Run 'azd up' to deploy"
echo "  2. Monitor deployment progress"
echo "  3. Verify application health post-deployment"
```

### Yapılandırma Dosyası Şablonu
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

## 📈 Dağıtım Sırasında Kapasite İzleme

### Gerçek Zamanlı Kapasite İzleme
```bash
# Dağıtım sırasında kapasiteyi izleyin
monitor_deployment_capacity() {
    local resource_group=$1
    
    echo "Monitoring capacity during deployment..."
    
    while true; do
        # Dağıtım durumunu kontrol edin
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
        
        # Mevcut kaynak kullanımını kontrol edin
        current_resources=$(az resource list \
            --resource-group "$resource_group" \
            --query "length([])")
        
        echo "$(date): Deployment in progress, $current_resources resources created"
        sleep 30
    done
}
```

## 🔗 AZD ile Entegrasyon

### azure.yaml Dosyasına Dağıtım Öncesi Hooklar Ekleyin
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

## En İyi Uygulamalar

1. **Her zaman kapasite kontrolleri yapın** yeni bölgelere dağıtmadan önce
2. **Kota kullanımını düzenli olarak izleyin** sürprizlerden kaçınmak için
3. **Büyümeyi planlayın** gelecekteki kapasite ihtiyaçlarını kontrol ederek
4. **Maliyet tahmin araçlarını kullanın** fatura şokunu önlemek için
5. **Kapasite gereksinimlerini belgeleyin** ekibiniz için
6. **Kapasite doğrulamasını otomatikleştirin** CI/CD süreçlerinde
7. **Bölgesel yedekleme** kapasite gereksinimlerini göz önünde bulundurun

## Sonraki Adımlar

- [SKU Seçimi Rehberi](sku-selection.md) - En uygun hizmet katmanlarını seçin
- [Dağıtım Öncesi Kontroller](preflight-checks.md) - Otomatik doğrulama scriptleri
- [Hızlı Referans](../../resources/cheat-sheet.md) - Hızlı komutlar
- [Terimler Sözlüğü](../../resources/glossary.md) - Terimler ve tanımlar

## Ek Kaynaklar

- [Azure Abonelik Limitleri](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits)
- [Azure Fiyatlandırma Hesaplayıcı](https://azure.microsoft.com/pricing/calculator/)
- [Azure Maliyet Yönetimi](https://learn.microsoft.com/en-us/azure/cost-management-billing/)
- [Azure Bölgesel Kullanılabilirlik](https://azure.microsoft.com/global-infrastructure/services/)

---

**Navigasyon**
- **Önceki Ders**: [Hata Ayıklama Rehberi](../troubleshooting/debugging.md)

- **Sonraki Ders**: [SKU Seçimi](sku-selection.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çeviriler hata veya yanlışlıklar içerebilir. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->