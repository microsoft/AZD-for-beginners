<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T19:53:58+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "tr"
}
-->
# SKU Seçim Rehberi - Doğru Azure Hizmet Katmanlarını Seçmek

## Giriş

Bu kapsamlı rehber, farklı ortamlar, iş yükleri ve gereksinimler için en uygun Azure hizmet SKU'larını (Stok Tutma Birimleri) seçmenize yardımcı olur. Performans ihtiyaçlarını, maliyet faktörlerini ve ölçeklenebilirlik gereksinimlerini analiz ederek Azure Developer CLI dağıtımlarınız için en uygun hizmet katmanlarını seçmeyi öğrenin.

## Öğrenme Hedefleri

Bu rehberi tamamladığınızda:
- Azure SKU kavramlarını, fiyatlandırma modellerini ve özellik farklılıklarını anlayacaksınız
- Geliştirme, test ve üretim ortamları için SKU seçimi stratejilerini öğreneceksiniz
- İş yükü gereksinimlerini analiz ederek uygun hizmet katmanlarını eşleştireceksiniz
- Akıllı SKU seçimi ile maliyet optimizasyon stratejilerini uygulayacaksınız
- SKU seçimleri için performans testi ve doğrulama tekniklerini kullanacaksınız
- Otomatik SKU önerileri ve izleme yapılandırmalarını uygulayacaksınız

## Öğrenme Çıktıları

Tamamlandığında:
- İş yükü gereksinimlerine ve kısıtlamalarına göre uygun Azure hizmet SKU'larını seçebileceksiniz
- Doğru katman seçimi ile maliyet etkin çoklu ortam mimarileri tasarlayabileceksiniz
- SKU seçimleri için performans karşılaştırması ve doğrulama yapabileceksiniz
- SKU önerisi ve maliyet optimizasyonu için otomatik araçlar oluşturabileceksiniz
- Değişen gereksinimler için SKU geçişlerini ve ölçeklendirme stratejilerini planlayabileceksiniz
- Azure İyi Tasarlanmış Çerçeve prensiplerini hizmet katmanı seçimine uygulayabileceksiniz

## İçindekiler

- [SKU'ları Anlamak](../../../../docs/pre-deployment)
- [Ortam Bazlı Seçim](../../../../docs/pre-deployment)
- [Hizmet-Specifik Kılavuzlar](../../../../docs/pre-deployment)
- [Maliyet Optimizasyon Stratejileri](../../../../docs/pre-deployment)
- [Performans Dikkatleri](../../../../docs/pre-deployment)
- [Hızlı Referans Tabloları](../../../../docs/pre-deployment)
- [Doğrulama Araçları](../../../../docs/pre-deployment)

---

## SKU'ları Anlamak

### SKU Nedir?

SKU'lar (Stok Tutma Birimleri), Azure kaynakları için farklı hizmet katmanlarını ve performans seviyelerini temsil eder. Her SKU farklı özellikler sunar:

- **Performans özellikleri** (CPU, bellek, veri aktarım hızı)
- **Özellik erişilebilirliği** (ölçeklendirme seçenekleri, SLA seviyeleri)
- **Fiyatlandırma modelleri** (tüketim bazlı, rezerve kapasite)
- **Bölgesel erişilebilirlik** (tüm SKU'lar her bölgede mevcut değildir)

### SKU Seçiminde Ana Faktörler

1. **İş Yükü Gereksinimleri**
   - Beklenen trafik/yük desenleri
   - Performans gereksinimleri (CPU, bellek, I/O)
   - Depolama ihtiyaçları ve erişim desenleri

2. **Ortam Türü**
   - Geliştirme/test vs. üretim
   - Erişilebilirlik gereksinimleri
   - Güvenlik ve uyumluluk ihtiyaçları

3. **Bütçe Kısıtlamaları**
   - Başlangıç maliyetleri vs. operasyonel maliyetler
   - Rezerve kapasite indirimleri
   - Otomatik ölçeklendirme maliyet etkileri

4. **Büyüme Projeksiyonları**
   - Ölçeklenebilirlik gereksinimleri
   - Gelecekteki özellik ihtiyaçları
   - Geçiş karmaşıklığı

---

## Ortam Bazlı Seçim

### Geliştirme Ortamı

**Öncelikler**: Maliyet optimizasyonu, temel işlevsellik, kolay sağlama/iptal

#### Önerilen SKU'lar
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
- **App Service**: F1 (Ücretsiz) veya B1 (Temel) basit testler için
- **Veritabanları**: Minimum kaynaklarla temel katman
- **Depolama**: Sadece yerel yedeklilik ile standart
- **Hesaplama**: Paylaşılan kaynaklar kabul edilebilir
- **Ağ**: Temel yapılandırmalar

### Test/Deneme Ortamı

**Öncelikler**: Üretim benzeri yapılandırma, maliyet dengesi, performans testi yeteneği

#### Önerilen SKU'lar
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
- **Özellikler**: Üretim özelliklerinin çoğu etkin
- **Yedeklilik**: Bazı coğrafi yedeklilik
- **Ölçeklendirme**: Test için sınırlı otomatik ölçeklendirme
- **İzleme**: Tam izleme paketi

### Üretim Ortamı

**Öncelikler**: Performans, erişilebilirlik, güvenlik, uyumluluk, ölçeklenebilirlik

#### Önerilen SKU'lar
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
- **Yüksek erişilebilirlik**: %99.9+ SLA gereksinimleri
- **Performans**: Özel kaynaklar, yüksek veri aktarım hızı
- **Güvenlik**: Premium güvenlik özellikleri
- **Ölçeklendirme**: Tam otomatik ölçeklendirme yetenekleri
- **İzleme**: Kapsamlı gözlemlenebilirlik

---

## Hizmet-Specifik Kılavuzlar

### Azure App Service

#### SKU Karar Matrisi

| Kullanım Durumu | Önerilen SKU | Gerekçe |
|------------------|--------------|---------|
| Geliştirme/Test | F1 (Ücretsiz) veya B1 (Temel) | Maliyet etkin, test için yeterli |
| Küçük üretim uygulamaları | S1 (Standart) | Özel alanlar, SSL, otomatik ölçeklendirme |
| Orta ölçekli üretim uygulamaları | P1V3 (Premium V3) | Daha iyi performans, daha fazla özellik |
| Yoğun trafik uygulamaları | P2V3 veya P3V3 | Özel kaynaklar, yüksek performans |
| Kritik uygulamalar | I1V2 (İzole V2) | Ağ izolasyonu, özel donanım |

#### Yapılandırma Örnekleri

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

### Azure SQL Veritabanı

#### SKU Seçim Çerçevesi

1. **DTU Bazlı (Veritabanı İşlem Birimleri)**
   - **Temel**: 5 DTU - Geliştirme/test
   - **Standart**: S0-S12 (10-3000 DTU) - Genel amaçlı
   - **Premium**: P1-P15 (125-4000 DTU) - Performans kritik

2. **vCore Bazlı** (Üretim için önerilir)
   - **Genel Amaçlı**: Dengeli hesaplama ve depolama
   - **İş Kritik**: Düşük gecikme, yüksek IOPS
   - **Hyperscale**: Çok ölçeklenebilir depolama (100TB'a kadar)

#### Örnek Yapılandırmalar

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

1. **Tüketim Bazlı**
   - Kullanım başına ödeme fiyatlandırması
   - Geliştirme ve değişken iş yükleri için uygun
   - Paylaşılan altyapı

2. **Özel (İş Yükü Profilleri)**
   - Özel hesaplama kaynakları
   - Tahmin edilebilir performans
   - Üretim iş yükleri için daha iyi

#### Yapılandırma Örnekleri

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

**Üretim (Özel)**
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

#### Veri Aktarım Modelleri

1. **Manuel Ayrılmış Veri Aktarımı**
   - Tahmin edilebilir performans
   - Rezerve kapasite indirimleri
   - Sabit iş yükleri için en iyisi

2. **Otomatik Ölçeklendirme Ayrılmış Veri Aktarımı**
   - Kullanıma göre otomatik ölçeklendirme
   - Minimum ile kullandığınız kadar ödeme
   - Değişken iş yükleri için iyi

3. **Sunucusuz**
   - İstek başına ödeme
   - Ayrılmış veri aktarımı yok
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

### Azure Depolama Hesabı

#### Depolama Hesabı Türleri

1. **Standard_LRS** - Geliştirme, kritik olmayan veriler
2. **Standard_GRS** - Üretim, coğrafi yedeklilik gerekli
3. **Premium_LRS** - Yüksek performanslı uygulamalar
4. **Premium_ZRS** - Bölge yedekliliği ile yüksek erişilebilirlik

#### Performans Katmanları

- **Standart**: Genel amaçlı, maliyet etkin
- **Premium**: Yüksek performanslı, düşük gecikmeli senaryolar

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

## Maliyet Optimizasyon Stratejileri

### 1. Rezerve Kapasite

1-3 yıl boyunca kaynakları rezerve ederek önemli indirimler elde edin:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Doğru Boyutlandırma

Küçük SKU'larla başlayın ve gerçek kullanıma göre büyütün:

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

### 3. Otomatik Ölçeklendirme Yapılandırması

Maliyetleri optimize etmek için akıllı ölçeklendirme uygulayın:

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

### 4. Zamanlanmış Ölçeklendirme

Yoğun olmayan saatlerde ölçeklendirmeyi azaltın:

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

## Performans Dikkatleri

### Temel Performans Gereksinimleri

SKU seçimi öncesinde net performans gereksinimlerini tanımlayın:

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
# Azure Load Testing service
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

## Hızlı Referans Tabloları

### App Service SKU Hızlı Referans

| SKU | Katman | vCPU | RAM | Depolama | Fiyat Aralığı | Kullanım Durumu |
|-----|-------|------|-----|----------|---------------|-----------------|
| F1 | Ücretsiz | Paylaşılan | 1GB | 1GB | Ücretsiz | Geliştirme |
| B1 | Temel | 1 | 1.75GB | 10GB | $ | Küçük uygulamalar |
| S1 | Standart | 1 | 1.75GB | 50GB | $$ | Üretim |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Yüksek performans |
| I1V2 | İzole V2 | 2 | 8GB | 1TB | $$$$ | Kurumsal |

### SQL Veritabanı SKU Hızlı Referans

| SKU | Katman | DTU/vCore | Depolama | Fiyat Aralığı | Kullanım Durumu |
|-----|-------|-----------|----------|---------------|-----------------|
| Temel | Temel | 5 DTU | 2GB | $ | Geliştirme |
| S2 | Standart | 50 DTU | 250GB | $$ | Küçük üretim |
| P2 | Premium | 250 DTU | 1TB | $$$ | Yüksek performans |
| GP_Gen5_4 | Genel Amaçlı | 4 vCore | 4TB | $$$ | Dengeli |
| BC_Gen5_8 | İş Kritik | 8 vCore | 4TB | $$$$ | Kritik görevler |

### Container Apps SKU Hızlı Referans

| Model | Fiyatlandırma | CPU/Bellek | Kullanım Durumu |
|-------|--------------|------------|-----------------|
| Tüketim | Kullanım başına ödeme | 0.25-2 vCPU | Geliştirme, değişken yük |
| Özel D4 | Rezerve | 4 vCPU, 16GB | Üretim |
| Özel D8 | Rezerve | 8 vCPU, 32GB | Yüksek performans |

---

## Doğrulama Araçları

### SKU Erişilebilirlik Kontrolü

```bash
#!/bin/bash
# Check SKU availability in target region

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

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### Maliyet Tahmin Scripti

```powershell
# PowerShell script for cost estimation
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
        
        # Use Azure Pricing API or calculator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Usage
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Performans Doğrulama

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

### Yapılacaklar

1. **Küçük başlayın ve büyütün** gerçek kullanıma göre
2. **Farklı ortamlar için farklı SKU'lar kullanın**
3. **Performansı ve maliyetleri sürekli izleyin**
4. **Üretim iş yükleri için rezerve kapasite kullanın**
5. **Uygun yerlerde otomatik ölçeklendirme uygulayın**
6. **Gerçekçi iş yükleriyle performans testi yapın**
7. **Büyümeyi planlayın ancak aşırı tahsis yapmaktan kaçının**
8. **Mümkün olduğunda ücretsiz katmanları kullanın**

### Yapılmayacaklar

1. **Geliştirme için üretim SKU'larını kullanmayın**
2. **Bölgesel SKU erişilebilirliğini göz ardı etmeyin**
3. **Veri aktarım maliyetlerini unutmayın**
4. **Gerekçesiz aşırı tahsis yapmayın**
5. **Bağımlılıkların etkisini göz ardı etmeyin**
6. **Otomatik ölçeklendirme limitlerini çok yüksek ayarlamayın**
7. **Uyumluluk gereksinimlerini unutmayın**
8. **Sadece fiyat temelinde karar vermeyin**

---

**İpucu**: Azure Maliyet Yönetimi ve Danışmanını kullanarak gerçek kullanım desenlerine dayalı olarak SKU seçimlerinizi optimize etmek için kişiselleştirilmiş öneriler alın.

---

**Navigasyon**
- **Önceki Ders**: [Kapasite Planlama](capacity-planning.md)
- **Sonraki Ders**: [Ön Kontroller](preflight-checks.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.