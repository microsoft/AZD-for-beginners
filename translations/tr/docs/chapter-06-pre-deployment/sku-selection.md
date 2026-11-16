# SKU Seçim Kılavuzu - Doğru Azure Hizmet Katmanlarını Seçme

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [Yeni Başlayanlar için AZD](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 6 - Ön Dağıtım Doğrulama & Planlama
- **⬅️ Önceki**: [Kapasite Planlaması](capacity-planning.md)
- **➡️ Sonraki**: [Uçuş Öncesi Kontroller](preflight-checks.md)
- **🚀 Sonraki Bölüm**: [Bölüm 7: Sorun Giderme](../chapter-07-troubleshooting/common-issues.md)

## Giriş

Bu kapsamlı kılavuz, farklı ortamlar, iş yükleri ve gereksinimler için optimal Azure hizmet SKU'larını (Stok Tutma Birimleri) seçmenize yardımcı olur. Azure Developer CLI dağıtımlarınız için performans ihtiyaçları, maliyet değerlendirmeleri ve ölçeklenebilirlik gereksinimlerini analiz ederek en uygun hizmet katmanlarını seçmeyi öğrenin.

## Öğrenme Hedefleri

Bu kılavuzu tamamlayarak:
- Azure SKU kavramlarını, fiyatlandırma modellerini ve özellik farklarını anlayacaksınız
- Geliştirme, hazırlık ve üretim için ortam bazlı SKU seçim stratejilerinde uzmanlaşacaksınız
- İş yükü gereksinimlerini analiz edip uygun hizmet katmanları ile eşleştireceksiniz
- Akıllı SKU seçimi ile maliyet optimizasyon stratejilerini uygulayacaksınız
- SKU seçimleri için performans testi ve doğrulama tekniklerini uygulayacaksınız
- Otomatik SKU önerileri ve izleme yapılandıracaksınız

## Öğrenme Çıktıları

Tamamladıktan sonra:
- İş yükü gereksinimleri ve kısıtlamalarına göre uygun Azure hizmet SKU'larını seçebileceksiniz
- Doğru katman seçimi ile çok ortamlı maliyet-etkin mimariler tasarlayabileceksiniz
- SKU seçimleri için performans kıyaslama ve doğrulama uygulayabileceksiniz
- SKU önerisi ve maliyet optimizasyonu için otomatik araçlar oluşturabileceksiniz
- Değişen gereksinimler için SKU geçişleri ve ölçeklendirme stratejileri planlayabileceksiniz
- Azure İyi Tasarlanmış Çerçeve prensiplerini hizmet katmanı seçiminde uygulayabileceksiniz

## İçindekiler

- [SKU'ları Anlamak](#understanding-skus)
- [Ortam Bazlı Seçim](#environment-based-selection)
- [Hizmete Özel Kılavuzlar](#service-specific-guidelines)
- [Maliyet Optimizasyonu Stratejileri](#cost-optimization-strategies)
- [Performans Dikkatleri](#performance-considerations)
- [Hızlı Referans Tabloları](#quick-reference-tables)
- [Doğrulama Araçları](#validation-tools)

---

## SKU'ları Anlamak

> **Örnek kapsam:** Aşağıdaki YAML SKU haritaları ve performans konfigürasyonları tasarım notlarıdır, bir `azure.yaml` şeması veya yük aracı konfigürasyonu değildir. Bicep blokları alternatifler/parçalar içindir: parametrelerini ve üst kaynaklarını beyan edin, birleştirirken benzersiz sembolik isimler kullanın ve modülleri çalışan bir projeye bağlayın. Fiyatlar, limitler ve bölge/SKU kullanılabilirliği aboneliğiniz için dağıtımdan önce kontrol edilmelidir.

### SKU'lar Nedir?

SKU'lar (Stok Tutma Birimleri), Azure kaynakları için farklı hizmet katmanları ve performans seviyelerini temsil eder. Her SKU aşağıdakilerde farklılık gösterir:

- **Performans özellikleri** (CPU, bellek, throughput)
- **Özellik kullanılabilirliği** (ölçeklendirme seçenekleri, SLA seviyeleri)
- **Fiyatlandırma modelleri** (tüketim bazlı, rezerve kapasite)
- **Bölgesel kullanılabilirlik** (tüm SKU'lar tüm bölgelerde mevcut değildir)

### SKU Seçiminde Ana Faktörler

1. **İş Yükü Gereksinimleri**
   - Beklenen trafik/yük desenleri
   - Performans gereksinimleri (CPU, bellek, G/Ç)
   - Depolama ihtiyaçları ve erişim desenleri

2. **Ortam Türü**
   - Geliştirme/test vs. üretim
   - Kullanılabilirlik gereksinimleri
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

**Öncelikler**: Maliyet optimizasyonu, temel işlevsellik, kolay tahsis/iptal

#### Önerilen SKU'lar
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Standard"      # Free tier is an account opt-in, not a SKU
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "workspace-based" # Consumption billing; no Free SKU
```

#### Özellikler
- **App Service**: Basit testler için F1 (Ücretsiz) veya B1 (Temel)
- **Veritabanları**: Minimum kaynaklarla temel katman
- **Depolama**: Sadece yerel yedeklilik ile standart
- **Hesaplama**: Paylaşılan kaynaklar kabul edilebilir
- **Ağ**: Temel konfigürasyonlar

### Hazırlık/Test Ortamı

**Öncelikler**: Üretim benzeri konfigürasyon, maliyet dengesi, performans testi yeteneği

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
- **Özellikler**: Üretim özelliklerinin çoğu aktif
- **Yedeklilik**: Bazı coğrafi yedeklilik
- **Ölçeklendirme**: Testler için sınırlı otomatik ölçeklendirme
- **İzleme**: Tam izleme yığını

### Üretim Ortamı

**Öncelikler**: Performans, kullanılabilirlik, güvenlik, uyumluluk, ölçeklenebilirlik

#### Önerilen SKU'lar
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Standard_GRS"    # Geo-redundant; Premium_GRS is not a storage SKU
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### Özellikler
- **Yüksek kullanılabilirlik**: %99.9+ SLA gereksinimleri
- **Performans**: Ayrılmış kaynaklar, yüksek verim
- **Güvenlik**: Premium güvenlik özellikleri
- **Ölçeklendirme**: Tam otomatik ölçeklendirme yetenekleri
- **İzleme**: Kapsamlı gözlemlenebilirlik

---

## Hizmete Özel Kılavuzlar

### Azure App Service

#### SKU Karar Matrisi

| Kullanım Durumu | Önerilen SKU | Gerekçesi |
|----------|----------------|-----------|
| Geliştirme/Test | F1 (Ücretsiz) veya B1 (Temel) | Maliyet-etkin, test için yeterli |
| Küçük üretim uygulamaları | S1 (Standart) | Özel alan adları, SSL, otomatik ölçeklendirme |
| Orta üretim uygulamaları | P1V3 (Premium V3) | Daha iyi performans, daha fazla özellik |
| Yüksek trafik uygulamaları | P2V3 veya P3V3 | Ayrılmış kaynaklar, yüksek performans |
| Kritik görev uygulamaları | I1V2 (İzole V2) | Ağ izolasyonu, ayrılmış donanım |

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

1. **DTU tabanlı (Veritabanı İşlem Birimleri)**
   - **Temel**: 5 DTU - Geliştirme/test
   - **Standart**: S0-S12 (10-3000 DTU) - Genel amaçlı
   - **Premium**: P1-P15 (125-4000 DTU) - Performans kritik

2. **vCore tabanlı** (Üretim için önerilen)
   - **Genel Amaç**: Dengeli hesaplama ve depolama
   - **İş Kritik**: Düşük gecikme, yüksek IOPS
   - **Hiperscale**: Yüksek ölçeklenebilir depolama; mevcut boyut sınırları ve bölgesel destek doğrulanmalı

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

1. **Tüketim bazlı**
   - Kullanım bazlı fiyatlandırma
   - Geliştirme ve değişken iş yükleri için uygun
   - Paylaşılan altyapı

2. **Özel (İş Yükü Profilleri)**
   - Ayrılmış hesaplama kaynakları
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
        targetPort: 80 // nginx listens on 80 by default
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

**Üretim (Ayrılmış)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 3
      maximumCount: 10
    }]
  }
}
```

Bölge yedekliliği ayrıca desteklenen bölge altyapısı ve uygun VNet/alt ağ konfigürasyonu gerektirir; burada atlanmıştır. Bu örnek üç adede kadar ayrılmış node bütçelendirir; bölge arası dağıtım için en az iki uygulama çoğaltması yapılandırın ve bölge arızası için çoğaltmaları ve nodeları boyutlandırın. Daha fazla bilgi için [Container Apps güvenilirlik rehberi](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps) bakınız. Bir uygulamayı bu profile atamak için `workloadProfileName: 'production-profile'` ayarlayın; sadece profil oluşturmak uygulamaları otomatik taşımıyor.

### Azure Cosmos DB

#### Throughput Modelleri

1. **Manuel Rezerve Edilmiş Throughput**
   - Öngörülebilir performans
   - Rezerve kapasite indirimleri
   - Sabit iş yükleri için en iyisi

2. **Otomatik Ölçeklenen Rezerve Throughput**
   - Kullanıma göre otomatik ölçeklendirme
   - Tüketilen kadar ödeme (minimum ile)
   - Değişken iş yükleri için iyi

3. **Sunucusuz**
   - İstek başına ödeme
   - Rezerve edilmiş throughput yok
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

### Azure Storage Hesabı

#### Depolama Hesabı Türleri

1. **Standard_LRS** - Geliştirme, kritik olmayan veriler
2. **Standard_GRS** - Üretim, coğrafi yedeklilik gerekliyse
3. **Premium_LRS** - Yüksek performans uygulamaları
4. **Premium_ZRS** - Bölge yedekliliği ile yüksek kullanılabilirlik

#### Performans Katmanları

- **Standart**: Genel amaç, maliyet-etkin
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

### 1. Rezerve Edilmiş Kapasite

1-3 yıl için kaynakları ayırtın ve önemli indirimlerden faydalanın:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Rezervasyon teklifleri ve uygun kaynak türleri değişir; her hizmet/SKU’nun rezervasyon desteklediğini varsaymak yerine kataloğu ve satın alma koşullarını inceleyin.

### 2. Doğru Boyutlandırma

Küçük SKU'larla başlayın ve gerçek kullanım temelinde yukarı ölçeklendirin:

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

### 3. Otomatik Ölçeklendirme Konfigürasyonu

Maliyeti optimize etmek için akıllı ölçeklendirme uygulayın:

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
            statistic: 'Average'
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
            statistic: 'Average'
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

### 4. Planlanmış Ölçeklendirme

Off-time saatlerinde ölçek küçültme:

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

SKU seçmeden önce net performans gereksinimleri tanımlayın:

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

Farklı SKU'ları test ederek performansı doğrulayın:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### İzleme ve Optimizasyon

Kapsamlı izleme yapılandırın:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    IngestionMode: 'LogAnalytics'
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
|-----|--------|------|-----|----------|--------------|-----------------|
| F1 | Ücretsiz | Paylaşılan | 1GB | 1GB | Ücretsiz | Geliştirme |
| B1 | Temel | 1 | 1.75GB | 10GB | $ | Küçük uygulamalar |
| S1 | Standart | 1 | 1.75GB | 50GB | $$ | Üretim |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Yüksek performans |
| I1V2 | İzole V2 | 2 | 8GB | 1TB | $$$$ | Kurumsal |

### SQL Veritabanı SKU Hızlı Referans

| SKU | Katman | DTU/vCore | Depolama | Fiyat Aralığı | Kullanım Durumu |
|-----|--------|----------|----------|--------------|-----------------|
| Basic | Temel | 5 DTU | 2GB | $ | Geliştirme |
| S2 | Standart | 50 DTU | 250GB | $$ | Küçük üretim |
| P2 | Premium | 250 DTU | 1TB | $$$ | Yüksek performans |
| GP_Gen5_4 | Genel Amaç | 4 vCore | 4TB | $$$ | Dengeli |
| BC_Gen5_8 | İş Kritik | 8 vCore | 4TB | $$$$ | Kritik görev |

### Container Apps SKU Hızlı Referans

| Model | Fiyatlandırma | CPU/Bellek | Kullanım Durumu |
|-------|-------------|------------|-----------------|
| Tüketim | Kullanıma göre ödeme | Desteklenen CPU/bellek kombinasyonları ortam/profile göre değişir | Geliştirme veya üretim, değişken yük |
| Ayrılmış D4 | Ayrılmış node faturalama | Her node için 4 vCPU, 16GiB | Sürekli yük/izolasyon ihtiyaçları |
| Ayrılmış D8 | Ayrılmış node faturalama | Her node için 8 vCPU, 32GiB | Daha yüksek sürekli yük |

---

## Doğrulama Araçları

### SKU Kullanılabilirlik Kontrolü

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
            # Name availability is not SKU availability.
            az storage sku list --query "[?name=='$sku'].{name:name,locations:locations,restrictions:restrictions}" --output json
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

**Yalnızca sözde kod:** Aşağıdaki `Get-ResourceCost` proje-özel bir fonksiyondur, geçerli bölgesel/sözleşme fiyatlandırması ve kullanım varsayımlarını kullanarak sizin tarafınızdan uygulanması gerekir. PowerShell veya Azure cmdlet değildir.

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

### Performans Doğrulaması

Aşağıdaki YAML bir gereksinim taslağıdır, **Azure Load Testing, JMeter, Locust veya k6 giriş şeması değildir**. Üstteki yük-test komutundan önce seçtiğiniz aracın gerçek yapılandırmasına dönüştürün.

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

1. **Küçük başlayın ve gerçek kullanıma göre ölçeklendirin**
2. **Farklı ortamlar için farklı SKU'lar kullanın**
3. **Performansı ve maliyetleri sürekli izleyin**
4. **Üretim iş yükleri için rezerve kapasiteyi kullanın**
5. **Uygun yerlerde otomatik ölçeklendirme uygulayın**
6. **Gerçekçi iş yükleriyle performans testleri yapın**
7. **Büyüme planlayın ama aşırı tahsis yapmaktan kaçının**
8. **Mümkün olduğunda geliştirme için ücretsiz katmanları kullanın**

### Yapılmaması Gerekenler

1. **Geliştirme için üretim SKU'larını kullanmayın**
2. **Bölgesel SKU kullanılabilirliğini göz ardı etmeyin**
3. **Veri transfer maliyetlerini unutmayın**
4. **Gerekçelendirmeden aşırı tahsis yapmayın**
5. **Bağımlılıkların etkisini görmezden gelmeyin**
6. **Otomatik ölçeklendirme sınırlarını çok yüksek ayarlamayın**
7. **Uyumluluk gereksinimlerini unutmayın**
8. **Sadece fiyata göre karar vermeyin**

---

**Profesyonel İpucu**: Azure Maliyet Yönetimi ve Danışmanı kullanarak gerçek kullanım desenlerine dayalı SKU seçimlerinizi optimize etmek için kişiselleştirilmiş öneriler alın.

---

**Navigasyon**
- **Önceki Ders**: [Kapasite Planlaması](capacity-planning.md)
- **Sonraki Ders**: [Uçuş Öncesi Kontroller](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->