# Panduan Pemilihan SKU - Memilih Tingkatan Layanan Azure yang Tepat

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 6 - Validasi & Perencanaan Pra-Penerapan
- **⬅️ Sebelumnya**: [Perencanaan Kapasitas](capacity-planning.md)
- **➡️ Selanjutnya**: [Pemeriksaan Awal](preflight-checks.md)
- **🚀 Bab Berikutnya**: [Bab 7: Pemecahan Masalah](../troubleshooting/common-issues.md)

## Pendahuluan

Panduan ini membantu Anda memilih SKU (Stock Keeping Units) layanan Azure yang optimal untuk berbagai lingkungan, beban kerja, dan kebutuhan. Pelajari cara menganalisis kebutuhan kinerja, pertimbangan biaya, dan persyaratan skalabilitas untuk memilih tingkatan layanan yang paling sesuai untuk penerapan Azure Developer CLI Anda.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan ini, Anda akan:
- Memahami konsep SKU Azure, model harga, dan perbedaan fitur
- Menguasai strategi pemilihan SKU berdasarkan lingkungan untuk pengembangan, staging, dan produksi
- Menganalisis kebutuhan beban kerja dan mencocokkannya dengan tingkatan layanan yang sesuai
- Menerapkan strategi optimasi biaya melalui pemilihan SKU yang cerdas
- Menggunakan teknik pengujian kinerja dan validasi untuk pilihan SKU
- Mengonfigurasi rekomendasi SKU otomatis dan pemantauan

## Hasil Pembelajaran

Setelah selesai, Anda akan dapat:
- Memilih SKU layanan Azure yang sesuai berdasarkan kebutuhan dan batasan beban kerja
- Merancang arsitektur multi-lingkungan yang hemat biaya dengan pemilihan tingkatan yang tepat
- Menerapkan benchmarking kinerja dan validasi untuk pilihan SKU
- Membuat alat otomatis untuk rekomendasi SKU dan optimasi biaya
- Merencanakan migrasi SKU dan strategi skalabilitas untuk kebutuhan yang berubah
- Menerapkan prinsip Kerangka Kerja Azure Well-Architected untuk pemilihan tingkatan layanan

## Daftar Isi

- [Memahami SKUs](../../../../docs/pre-deployment)
- [Pemilihan Berdasarkan Lingkungan](../../../../docs/pre-deployment)
- [Panduan Spesifik Layanan](../../../../docs/pre-deployment)
- [Strategi Optimasi Biaya](../../../../docs/pre-deployment)
- [Pertimbangan Kinerja](../../../../docs/pre-deployment)
- [Tabel Referensi Cepat](../../../../docs/pre-deployment)
- [Alat Validasi](../../../../docs/pre-deployment)

---

## Memahami SKUs

### Apa itu SKUs?

SKU (Stock Keeping Units) mewakili tingkatan layanan dan tingkat kinerja yang berbeda untuk sumber daya Azure. Setiap SKU menawarkan:

- **Karakteristik kinerja** (CPU, memori, throughput)
- **Ketersediaan fitur** (opsi skalabilitas, tingkat SLA)
- **Model harga** (berbasis konsumsi, kapasitas yang dipesan)
- **Ketersediaan regional** (tidak semua SKU tersedia di semua wilayah)

### Faktor Utama dalam Pemilihan SKU

1. **Kebutuhan Beban Kerja**
   - Pola lalu lintas/beban yang diharapkan
   - Persyaratan kinerja (CPU, memori, I/O)
   - Kebutuhan penyimpanan dan pola akses

2. **Jenis Lingkungan**
   - Pengembangan/pengujian vs. produksi
   - Persyaratan ketersediaan
   - Kebutuhan keamanan dan kepatuhan

3. **Keterbatasan Anggaran**
   - Biaya awal vs. biaya operasional
   - Diskon kapasitas yang dipesan
   - Implikasi biaya auto-scaling

4. **Proyeksi Pertumbuhan**
   - Persyaratan skalabilitas
   - Kebutuhan fitur di masa depan
   - Kompleksitas migrasi

---

## Pemilihan Berdasarkan Lingkungan

### Lingkungan Pengembangan

**Prioritas**: Optimasi biaya, fungsionalitas dasar, kemudahan penyediaan/penghapusan

#### SKU yang Direkomendasikan
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

#### Karakteristik
- **App Service**: F1 (Gratis) atau B1 (Dasar) untuk pengujian sederhana
- **Database**: Tingkatan dasar dengan sumber daya minimal
- **Penyimpanan**: Standar dengan redundansi lokal saja
- **Komputasi**: Sumber daya bersama dapat diterima
- **Jaringan**: Konfigurasi dasar

### Lingkungan Staging/Pengujian

**Prioritas**: Konfigurasi mirip produksi, keseimbangan biaya, kemampuan pengujian kinerja

#### SKU yang Direkomendasikan
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

#### Karakteristik
- **Kinerja**: 70-80% kapasitas produksi
- **Fitur**: Sebagian besar fitur produksi diaktifkan
- **Redundansi**: Beberapa redundansi geografis
- **Skalabilitas**: Auto-scaling terbatas untuk pengujian
- **Pemantauan**: Stack pemantauan penuh

### Lingkungan Produksi

**Prioritas**: Kinerja, ketersediaan, keamanan, kepatuhan, skalabilitas

#### SKU yang Direkomendasikan
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

#### Karakteristik
- **Ketersediaan tinggi**: Persyaratan SLA 99.9%+
- **Kinerja**: Sumber daya khusus, throughput tinggi
- **Keamanan**: Fitur keamanan premium
- **Skalabilitas**: Kemampuan auto-scaling penuh
- **Pemantauan**: Observabilitas yang komprehensif

---

## Panduan Spesifik Layanan

### Azure App Service

#### Matriks Keputusan SKU

| Kasus Penggunaan | SKU yang Direkomendasikan | Alasan |
|------------------|---------------------------|--------|
| Pengembangan/Pengujian | F1 (Gratis) atau B1 (Dasar) | Hemat biaya, cukup untuk pengujian |
| Aplikasi produksi kecil | S1 (Standar) | Domain khusus, SSL, auto-scaling |
| Aplikasi produksi menengah | P1V3 (Premium V3) | Kinerja lebih baik, lebih banyak fitur |
| Aplikasi dengan lalu lintas tinggi | P2V3 atau P3V3 | Sumber daya khusus, kinerja tinggi |
| Aplikasi penting | I1V2 (Isolated V2) | Isolasi jaringan, perangkat keras khusus |

#### Contoh Konfigurasi

**Pengembangan**
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

**Produksi**
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

#### Kerangka Pemilihan SKU

1. **Berbasis DTU (Database Transaction Units)**
   - **Dasar**: 5 DTU - Pengembangan/pengujian
   - **Standar**: S0-S12 (10-3000 DTU) - Tujuan umum
   - **Premium**: P1-P15 (125-4000 DTU) - Kinerja kritis

2. **Berbasis vCore** (Direkomendasikan untuk produksi)
   - **Tujuan Umum**: Komputasi dan penyimpanan seimbang
   - **Bisnis Kritis**: Latensi rendah, IOPS tinggi
   - **Hyperscale**: Penyimpanan sangat skalabel (hingga 100TB)

#### Contoh Konfigurasi

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

#### Jenis Lingkungan

1. **Berbasis Konsumsi**
   - Harga bayar sesuai penggunaan
   - Cocok untuk pengembangan dan beban kerja variabel
   - Infrastruktur bersama

2. **Dedicated (Profil Beban Kerja)**
   - Sumber daya komputasi khusus
   - Kinerja yang dapat diprediksi
   - Lebih baik untuk beban kerja produksi

#### Contoh Konfigurasi

**Pengembangan (Konsumsi)**
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

**Produksi (Dedicated)**
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

#### Model Throughput

1. **Throughput yang Disediakan Manual**
   - Kinerja yang dapat diprediksi
   - Diskon kapasitas yang dipesan
   - Terbaik untuk beban kerja yang stabil

2. **Throughput yang Disediakan Autoscale**
   - Skalabilitas otomatis berdasarkan penggunaan
   - Bayar sesuai penggunaan (dengan minimum)
   - Baik untuk beban kerja variabel

3. **Serverless**
   - Bayar per permintaan
   - Tidak ada throughput yang disediakan
   - Ideal untuk pengembangan dan beban kerja intermiten

#### Contoh SKU

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

#### Jenis Akun Penyimpanan

1. **Standard_LRS** - Pengembangan, data non-kritis
2. **Standard_GRS** - Produksi, membutuhkan geo-redundansi
3. **Premium_LRS** - Aplikasi berkinerja tinggi
4. **Premium_ZRS** - Ketersediaan tinggi dengan redundansi zona

#### Tingkatan Kinerja

- **Standar**: Tujuan umum, hemat biaya
- **Premium**: Kinerja tinggi, skenario latensi rendah

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

## Strategi Optimasi Biaya

### 1. Kapasitas yang Dipesan

Pesan sumber daya untuk 1-3 tahun untuk diskon signifikan:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Penyesuaian Ukuran

Mulai dengan SKU yang lebih kecil dan tingkatkan berdasarkan penggunaan aktual:

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

### 3. Konfigurasi Auto-Scaling

Terapkan skalabilitas cerdas untuk mengoptimalkan biaya:

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

### 4. Skalabilitas Terjadwal

Turunkan skala selama jam tidak sibuk:

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

## Pertimbangan Kinerja

### Persyaratan Kinerja Dasar

Tentukan persyaratan kinerja yang jelas sebelum memilih SKU:

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

### Pengujian Beban

Uji berbagai SKU untuk memvalidasi kinerja:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Pemantauan dan Optimasi

Siapkan pemantauan yang komprehensif:

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

## Tabel Referensi Cepat

### Referensi Cepat SKU App Service

| SKU | Tingkatan | vCPU | RAM | Penyimpanan | Rentang Harga | Kasus Penggunaan |
|-----|----------|------|-----|-------------|---------------|------------------|
| F1 | Gratis | Bersama | 1GB | 1GB | Gratis | Pengembangan |
| B1 | Dasar | 1 | 1.75GB | 10GB | $ | Aplikasi kecil |
| S1 | Standar | 1 | 1.75GB | 50GB | $$ | Produksi |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Kinerja tinggi |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Perusahaan |

### Referensi Cepat SKU SQL Database

| SKU | Tingkatan | DTU/vCore | Penyimpanan | Rentang Harga | Kasus Penggunaan |
|-----|----------|-----------|-------------|---------------|------------------|
| Dasar | Dasar | 5 DTU | 2GB | $ | Pengembangan |
| S2 | Standar | 50 DTU | 250GB | $$ | Produksi kecil |
| P2 | Premium | 250 DTU | 1TB | $$$ | Kinerja tinggi |
| GP_Gen5_4 | Tujuan Umum | 4 vCore | 4TB | $$$ | Seimbang |
| BC_Gen5_8 | Bisnis Kritis | 8 vCore | 4TB | $$$$ | Penting |

### Referensi Cepat SKU Container Apps

| Model | Harga | CPU/Memori | Kasus Penggunaan |
|-------|-------|------------|------------------|
| Konsumsi | Bayar sesuai penggunaan | 0.25-2 vCPU | Pengembangan, beban variabel |
| Dedicated D4 | Dipesan | 4 vCPU, 16GB | Produksi |
| Dedicated D8 | Dipesan | 8 vCPU, 32GB | Kinerja tinggi |

---

## Alat Validasi

### Pemeriksa Ketersediaan SKU

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

### Skrip Estimasi Biaya

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

### Validasi Kinerja

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

## Ringkasan Praktik Terbaik

### Yang Harus Dilakukan

1. **Mulai kecil dan tingkatkan** berdasarkan penggunaan aktual
2. **Gunakan SKU berbeda untuk lingkungan berbeda**
3. **Pantau kinerja dan biaya secara terus-menerus**
4. **Manfaatkan kapasitas yang dipesan untuk beban kerja produksi**
5. **Terapkan auto-scaling jika sesuai**
6. **Uji kinerja dengan beban kerja realistis**
7. **Rencanakan pertumbuhan tetapi hindari over-provisioning**
8. **Gunakan tingkatan gratis untuk pengembangan jika memungkinkan**

### Yang Tidak Harus Dilakukan

1. **Jangan gunakan SKU produksi untuk pengembangan**
2. **Jangan abaikan ketersediaan SKU regional**
3. **Jangan lupakan biaya transfer data**
4. **Jangan over-provision tanpa alasan**
5. **Jangan abaikan dampak dari dependensi**
6. **Jangan tetapkan batas auto-scaling terlalu tinggi**
7. **Jangan lupakan persyaratan kepatuhan**
8. **Jangan membuat keputusan hanya berdasarkan harga**

---

**Tips Profesional**: Gunakan Azure Cost Management dan Advisor untuk mendapatkan rekomendasi yang dipersonalisasi untuk mengoptimalkan pilihan SKU Anda berdasarkan pola penggunaan aktual.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Perencanaan Kapasitas](capacity-planning.md)
- **Pelajaran Selanjutnya**: [Pemeriksaan Awal](preflight-checks.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.