# SKU Seçim Rehberi - Doğru Azure Hizmet Katmanlarını Seçmek

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Yeni Başlayanlar](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 6 - Dağıtımdan Önce Doğrulama ve Planlama
- **⬅️ Önceki**: [Kapasite Planlaması](capacity-planning.md)
- **➡️ Sonraki**: [Uçuş Öncesi Kontroller](preflight-checks.md)
- **🚀 Sonraki Bölüm**: [Bölüm 7: Sorun Giderme](../chapter-07-troubleshooting/common-issues.md)

## Giriş

Bu kapsamlı rehber, farklı ortamlar, iş yükleri ve gereksinimler için optimal Azure hizmet SKU'larını (Stock Keeping Units) seçmenize yardımcı olur. Azure Developer CLI dağıtımlarınız için en uygun hizmet katmanlarını seçmek üzere performans ihtiyaçlarını, maliyet değerlendirmelerini ve ölçeklenebilirlik gereksinimlerini nasıl analiz edeceğinizi öğrenin.

## Öğrenme Hedefleri

Bu rehberi tamamlayarak:
- Azure SKU kavramlarını, fiyatlandırma modellerini ve özellik farklarını anlayacaksınız
- Geliştirme, sahneleme ve üretim için ortam-spesifik SKU seçim stratejilerini öğreneceksiniz
- İş yükü gereksinimlerini analiz edip bunları uygun hizmet katmanlarıyla eşleştirebileceksiniz
- Akıllı SKU seçimiyle maliyet optimizasyonu stratejilerini uygulayabileceksiniz
- SKU tercihleri için performans testleri ve doğrulama tekniklerini uygulayabileceksiniz
- Otomatik SKU önerileri ve izleme yapılandırmaları oluşturabileceksiniz

## Öğrenme Çıktıları

Tamamlandığında, şu yetkinliklere sahip olacaksınız:
- İş yükü gereksinimleri ve kısıtlamalarına göre uygun Azure hizmet SKU'larını seçmek
- Uygun katman seçimiyle maliyet-etkin çoklu ortam mimarileri tasarlamak
- SKU tercihleri için performans kıyaslaması ve doğrulama uygulamak
- SKU önerisi ve maliyet optimizasyonu için otomatik araçlar oluşturmak
- Değişen gereksinimler için SKU geçişleri ve ölçeklendirme stratejileri planlamak
- Hizmet katmanı seçimine Azure Well-Architected Framework ilkelerini uygulamak

## İçindekiler

- [SKU'ları Anlamak](../../../../docs/chapter-06-pre-deployment)
- [Ortam Tabanlı Seçim](../../../../docs/chapter-06-pre-deployment)
- [Servise Özel Yönergeler](../../../../docs/chapter-06-pre-deployment)
- [Maliyet Optimizasyonu Stratejileri](../../../../docs/chapter-06-pre-deployment)
- [Performans Hususları](../../../../docs/chapter-06-pre-deployment)
- [Hızlı Başvuru Tabloları](../../../../docs/chapter-06-pre-deployment)
- [Doğrulama Araçları](../../../../docs/chapter-06-pre-deployment)

---

## SKU'ları Anlamak

### SKU'lar nedir?

SKU'lar (Stock Keeping Units), Azure kaynakları için farklı hizmet katmanlarını ve performans seviyelerini temsil eder. Her SKU farklı sunar:

- **Performans özellikleri** (CPU, bellek, verim)
- **Özellik kullanılabilirliği** (ölçeklendirme seçenekleri, SLA seviyeleri)
- **Fiyatlandırma modelleri** (tüketim bazlı, rezerve kapasite)
- **Bölgesel kullanılabilirlik** (tüm SKU'lar tüm bölgelerde mevcut değildir)

### SKU Seçiminde Ana Faktörler

1. **İş Yükü Gereksinimleri**
   - Beklenen trafik/yük desenleri
   - Performans gereksinimleri (CPU, bellek, I/O)
   - Depolama ihtiyaçları ve erişim desenleri

2. **Ortam Türü**
   - Geliştirme/test vs. üretim
   - Kullanılabilirlik gereksinimleri
   - Güvenlik ve uyumluluk ihtiyaçları

3. **Bütçe Kısıtları**
   - Başlangıç maliyetleri vs. işletme maliyetleri
   - Rezerve kapasite indirimleri
   - Otomatik ölçeklemenin maliyet etkileri

4. **Büyüme Projeksiyonları**
   - Ölçeklenebilirlik gereksinimleri
   - Gelecekteki özellik ihtiyaçları
   - Geçiş karmaşıklığı

---

## Ortam Tabanlı Seçim

### Geliştirme Ortamı

**Öncelikler**: Maliyet optimizasyonu, temel işlevsellik, kolay sağlama/kaldırma

#### Recommended SKUs
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Free"          # Free tier (400 RU/s)
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "Free" # First 5GB free
```

#### Özellikler
- **App Service**: Basit testler için F1 (Ücretsiz) veya B1 (Basic)
- **Veritabanları**: Minimum kaynaklarla Basic katman
- **Depolama**: Sadece yerel yedeklemeli Standard
- **Hesaplama**: Paylaşılan kaynaklar kabul edilebilir
- **Ağ**: Temel yapılandırmalar

### Sahneleme/Test Ortamı

**Öncelikler**: Üretim benzeri yapılandırma, maliyet dengesi, performans testi yeteneği

#### Recommended SKUs
```yaml
# Staging environment configuration
environment: staging
skus:
  app_service: "S1"          # Standard tier
  sql_database: "S2"         # Standard tier, 50 DTU
  storage: "Standard_GRS"    # Geo-redundant
  cosmos_db: "Standard"      # 400 RU/s provisioned
  container_apps: "Consumption" # Pay-per-use
```

#### Özellikler
- **Performans**: Üretim kapasitesinin %70-80'i
- **Özellikler**: Çoğu üretim özelliği etkin
- **Yedeklilik**: Bir miktar coğrafi yedeklilik
- **Ölçekleme**: Test için sınırlı otomatik ölçekleme
- **İzleme**: Tam izleme yığını

### Üretim Ortamı

**Öncelikler**: Performans, kullanılabilirlik, güvenlik, uyumluluk, ölçeklenebilirlik

#### Recommended SKUs
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Premium_GRS"     # Premium geo-redundant
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### Özellikler
- **Yüksek kullanılabilirlik**: %99.9+ SLA gereksinimleri
- **Performans**: Adanmış kaynaklar, yüksek verim
- **Güvenlik**: Premium güvenlik özellikleri
- **Ölçekleme**: Tam otomatik ölçekleme yetenekleri
- **İzleme**: Kapsamlı gözlemlenebilirlik

---

## Servise Özel Yönergeler

### Azure App Service

#### SKU Karar Matrisi

| Kullanım Durumu | Önerilen SKU | Gerekçe |
|----------|----------------|-----------|
| Geliştirme/Test | F1 (Free) or B1 (Basic) | Maliyet-etkin, test için yeterli |
| Küçük üretim uygulamaları | S1 (Standard) | Özel alan adları, SSL, otomatik ölçekleme |
| Orta ölçek üretim uygulamaları | P1V3 (Premium V3) | Daha iyi performans, daha fazla özellik |
| Yüksek trafikli uygulamalar | P2V3 or P3V3 | Adanmış kaynaklar, yüksek performans |
| Kritik görev uygulamaları | I1V2 (Isolated V2) | Ağ izolasyonu, adanmış donanım |

#### Konfigürasyon Örnekleri

**Geliştirme**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-dev'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
  properties: {
    reserved: false
  }
}
```

**Üretim**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-prod'
  location: location
  sku: {
    name: 'P1V3'
    tier: 'PremiumV3'
    capacity: 3
  }
  properties: {
    reserved: false
  }
}
```

### Azure SQL Database

#### SKU Seçim Çerçevesi

1. **DTU tabanlı (Database Transaction Units)**
   - **Basic**: 5 DTU - Geliştirme/test
   - **Standard**: S0-S12 (10-3000 DTU) - Genel amaç
   - **Premium**: P1-P15 (125-4000 DTU) - Performans kritik

2. **vCore tabanlı** (Üretim için önerilen)
   - **General Purpose**: Dengeli işlem ve depolama
   - **Business Critical**: Düşük gecikme, yüksek IOPS
   - **Hyperscale**: Yüksek ölçeklenebilir depolama (up to 100TB)

#### Örnek Konfigürasyonlar

```bicep
// Development
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-dev'
  parent: sqlServer
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    maxSizeBytes: 2147483648 // 2GB
  }
}

// Production
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-prod'
  parent: sqlServer
  location: location
  sku: {
    name: 'GP_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 4
  }
  properties: {
    maxSizeBytes: 536870912000 // 500GB
  }
}
```

### Azure Container Apps

#### Ortam Türleri

1. **Tüketim tabanlı**
   - Kullandıkça öde fiyatlandırma
   - Geliştirme ve değişken iş yükleri için uygun
   - Paylaşılan altyapı

2. **Adanmış (İş Yükü Profilleri)**
   - Adanmış hesaplama kaynakları
   - Öngörülebilir performans
   - Üretim iş yükleri için daha iyi

#### Konfigürasyon Örnekleri

**Geliştirme (Tüketim)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-dev'
  location: location
  properties: {
    zoneRedundant: false
  }
}

resource containerApp 'Microsoft.App/containerApps@2022-10-01' = {
  name: 'ca-${environmentName}-dev'
  location: location
  properties: {
    managedEnvironmentId: containerAppEnvironment.id
    configuration: {
      ingress: {
        external: true
        targetPort: 3000
      }
    }
    template: {
      containers: [{
        name: 'main'
        image: 'nginx:latest'
        resources: {
          cpu: json('0.25')
          memory: '0.5Gi'
        }
      }]
      scale: {
        minReplicas: 0
        maxReplicas: 1
      }
    }
  }
}
```

**Üretim (Adanmış)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 2
      maximumCount: 10
    }]
  }
}
```

### Azure Cosmos DB

#### İşlem Hacmi Modelleri

1. **Manuel Tahsis Edilmiş İşlem Hacmi**
   - Öngörülebilir performans
   - Rezerve kapasite indirimleri
   - Dengeli iş yükleri için en iyi

2. **Otomatik Ölçeklenebilir Tahsis Edilmiş İşlem Hacmi**
   - Kullanıma göre otomatik ölçeklenir
   - Kullandığınız kadar ödersiniz (minimum ile)
   - Değişken iş yükleri için iyi

3. **Sunucusuz**
   - İstek başına ödeme
   - Tahsis edilmiş işlem hacmi yok
   - Geliştirme ve aralıklı iş yükleri için ideal

#### SKU Örnekleri

```bicep
// Development - Serverless
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-dev'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [{
      locationName: location
    }]
    capabilities: [{
      name: 'EnableServerless'
    }]
  }
}

// Production - Provisioned with Autoscale
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-prod'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
      }
      {
        locationName: secondaryLocation
        failoverPriority: 1
      }
    ]
    enableAutomaticFailover: true
    enableMultipleWriteLocations: false
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  name: 'main'
  parent: cosmosAccount
  properties: {
    resource: {
      id: 'main'
    }
    options: {
      autoscaleSettings: {
        maxThroughput: 4000
      }
    }
  }
}
```

### Azure Storage Account

#### Depolama Hesabı Türleri

1. **Standard_LRS** - Geliştirme, kritik olmayan veriler
2. **Standard_GRS** - Üretim, coğrafi yedeklilik gerektiğinde
3. **Premium_LRS** - Yüksek performanslı uygulamalar
4. **Premium_ZRS** - Bölge yedekliliği ile yüksek kullanılabilirlik

#### Performans Katmanları

- **Standard**: Genel amaç, maliyet-etkin
- **Premium**: Yüksek performans, düşük gecikme senaryoları

```bicep
// Development
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}dev'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
  }
}

// Production
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}prod'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    networkAcls: {
      defaultAction: 'Deny'
      virtualNetworkRules: []
      ipRules: []
    }
  }
}
```

---

## Maliyet Optimizasyonu Stratejileri

### 1. Rezerve Kapasite

Kaynakları 1-3 yıl rezerve edin, önemli indirimler elde edin:

```bash
# Rezervasyon seçeneklerini kontrol et
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Doğru Boyutlandırma

Daha küçük SKU'larla başlayın ve gerçek kullanım temelinde yukarı ölçeklendirin:

```yaml
# Progressive scaling approach
development:
  app_service: "F1"    # Free tier
testing:
  app_service: "B1"    # Basic tier  
staging:
  app_service: "S1"    # Standard tier
production:
  app_service: "P1V3"  # Premium tier
```

### 3. Otomatik Ölçekleme Yapılandırması

Maliyetleri optimize etmek için akıllı ölçekleme uygulayın:

```bicep
resource autoScaleSettings 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'autoscale-${appServicePlan.name}'
  location: location
  properties: {
    profiles: [{
      name: 'default'
      capacity: {
        minimum: '1'
        maximum: '10'
        default: '2'
      }
      rules: [
        {
          metricTrigger: {
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'GreaterThan'
            threshold: 70
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Increase'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
        {
          metricTrigger: {
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'LessThan'
            threshold: 30
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Decrease'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
      ]
    }]
    enabled: true
    targetResourceUri: appServicePlan.id
  }
}
```

### 4. Zamanlanmış Ölçekleme

İş dışı saatlerde küçültün:

```json
{
  "profiles": [
    {
      "name": "business-hours",
      "capacity": {
        "minimum": "2",
        "maximum": "10", 
        "default": "3"
      },
      "recurrence": {
        "frequency": "Week",
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [8],
          "minutes": [0]
        }
      }
    },
    {
      "name": "off-hours",
      "capacity": {
        "minimum": "1",
        "maximum": "2",
        "default": "1"
      },
      "recurrence": {
        "frequency": "Week", 
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [18],
          "minutes": [0]
        }
      }
    }
  ]
}
```

---

## Performans Hususları

### Temel Performans Gereksinimleri

SKU seçiminden önce net performans gereksinimleri tanımlayın:

```yaml
performance_requirements:
  response_time:
    p95: "< 500ms"
    p99: "< 1000ms"
  throughput:
    requests_per_second: 1000
    concurrent_users: 500
  availability:
    uptime: "99.9%"
    rpo: "15 minutes"
    rto: "30 minutes"
```

### Yük Testi

Performansı doğrulamak için farklı SKU'ları test edin:

```bash
# Azure Load Testing hizmeti
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### İzleme ve Optimizasyon

Kapsamlı izleme kurun:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    RetentionInDays: 90
  }
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'law-${environmentName}'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}
```

---

## Hızlı Başvuru Tabloları

### App Service SKU Hızlı Başvuru

| SKU | Katman | vCPU | RAM | Depolama | Fiyat Aralığı | Kullanım Durumu |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Ücretsiz | Paylaşılan | 1GB | 1GB | Ücretsiz | Geliştirme |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Küçük uygulamalar |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Üretim |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Yüksek performans |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Kurumsal |

### SQL Database SKU Hızlı Başvuru

| SKU | Katman | DTU/vCore | Depolama | Fiyat Aralığı | Kullanım Durumu |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Geliştirme |
| S2 | Standard | 50 DTU | 250GB | $$ | Küçük üretim |
| P2 | Premium | 250 DTU | 1TB | $$$ | Yüksek performans |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Dengeli |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Misyon kritik |

### Container Apps SKU Hızlı Başvuru

| Model | Fiyatlandırma | CPU/Bellek | Kullanım Durumu |
|-------|---------|------------|----------|
| Consumption | Kullandıkça öde | 0.25-2 vCPU | Geliştirme, değişken yük |
| Dedicated D4 | Rezerve | 4 vCPU, 16GB | Üretim |
| Dedicated D8 | Rezerve | 8 vCPU, 32GB | Yüksek performans |

---

## Doğrulama Araçları

### SKU Availability Checker

```bash
#!/bin/bash
# Hedef bölgedeki SKU kullanılabilirliğini kontrol edin

check_sku_availability() {
    local region=$1
    local resource_type=$2
    local sku=$3
    
    echo "Checking $sku availability for $resource_type in $region..."
    
    case $resource_type in
        "app-service")
            az appservice list-locations --sku $sku --output table
            ;;
        "sql-database")
            az sql db list-editions --location $region --output table
            ;;
        "storage")
            az storage account check-name --name "test" --output table
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# Kullanım
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# Maliyet tahmini için PowerShell betiği
function Get-AzureCostEstimate {
    param(
        [string]$SubscriptionId,
        [string]$ResourceGroup,
        [hashtable]$Resources
    )
    
    $totalCost = 0
    
    foreach ($resource in $Resources.GetEnumerator()) {
        $resourceType = $resource.Key
        $sku = $resource.Value
        
        # Azure Fiyatlandırma API'sini veya hesaplayıcısını kullanın
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Kullanım
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Performance Validation

```yaml
# Load test configuration for SKU validation
test_configuration:
  duration: "10m"
  users:
    spawn_rate: 10
    max_users: 100
  
  scenarios:
    - name: "sku_performance_test"
      requests:
        - url: "https://myapp.azurewebsites.net/api/health"
          method: "GET"
          expect:
            - status_code: 200
            - response_time_ms: 500
        
        - url: "https://myapp.azurewebsites.net/api/data"
          method: "POST"
          expect:
            - status_code: 201
            - response_time_ms: 1000

  thresholds:
    http_req_duration:
      - "p(95)<500"  # 95% of requests under 500ms
      - "p(99)<1000" # 99% of requests under 1s
    http_req_failed:
      - "rate<0.1"   # Less than 10% failure rate
```

---

## En İyi Uygulamalar Özeti

### Yapılması Gerekenler

1. **Küçük başlayın ve gerçek kullanım temelinde ölçeklendirin**
2. **Farklı ortamlar için farklı SKU'lar kullanın**
3. **Performansı ve maliyetleri sürekli izleyin**
4. **Üretim iş yükleri için rezerve kapasiteden yararlanın**
5. **Uygun yerlerde otomatik ölçeklemeyi uygulayın**
6. **Gerçekçi iş yükleriyle performans testleri yapın**
7. **Büyümeyi planlayın, ancak aşırı kaynak ayırmaktan kaçının**
8. **Mümkün olduğunda geliştirme için ücretsiz katmanları kullanın**

### Yapılmaması Gerekenler

1. **Geliştirme için üretim SKU'larını kullanmayın**
2. **Bölgesel SKU kullanılabilirliğini görmezden gelmeyin**
3. **Veri transfer maliyetlerini unutmayın**
4. **Gerekçe olmadan aşırı kaynak ayırmayın**
5. **Bağımlılıkların etkisini göz ardı etmeyin**
6. **Otomatik ölçekleme limitlerini çok yüksek ayarlamayın**
7. **Uyumluluk gereksinimlerini unutmayın**
8. **Sadece fiyata göre karar vermeyin**

---

**İpucu**: Azure Cost Management ve Advisor'ı kullanarak SKU seçimlerinizi gerçek kullanım desenlerine göre optimize etmek için kişiselleştirilmiş öneriler alın.

---

**Gezinme**
- **Önceki Ders**: [Kapasite Planlaması](capacity-planning.md)
- **Sonraki Ders**: [Uçuş Öncesi Kontroller](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Feragatname:
Bu belge, Co-op Translator (https://github.com/Azure/co-op-translator) adlı yapay zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, özgün dilindeki haliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->