# Panduan Pemilihan SKU - Memilih Tingkatan Layanan Azure yang Tepat

**Navigasi Bab:**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 6 - Validasi & Perencanaan Pra-Penerapan
- **⬅️ Sebelumnya**: [Perencanaan Kapasitas](capacity-planning.md)
- **➡️ Berikutnya**: [Pemeriksaan Pra-penerbangan](preflight-checks.md)
- **🚀 Bab Berikutnya**: [Bab 7: Pemecahan Masalah](../chapter-07-troubleshooting/common-issues.md)

## Pendahuluan

Panduan komprehensif ini membantu Anda memilih SKU layanan Azure (Stock Keeping Units) yang optimal untuk berbagai lingkungan, beban kerja, dan kebutuhan. Pelajari cara menganalisis kebutuhan kinerja, pertimbangan biaya, dan kebutuhan skalabilitas untuk memilih tingkat layanan yang paling tepat untuk penerapan Azure Developer CLI Anda.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan ini, Anda akan:
- Memahami konsep SKU Azure, model harga, dan perbedaan fitur
- Menguasai strategi pemilihan SKU berdasarkan lingkungan untuk pengembangan, staging, dan produksi
- Menganalisis kebutuhan beban kerja dan mencocokkannya dengan tingkat layanan yang tepat
- Menerapkan strategi optimasi biaya melalui pemilihan SKU yang cerdas
- Menerapkan teknik pengujian dan validasi kinerja untuk pilihan SKU
- Mengonfigurasi rekomendasi SKU otomatis dan pemantauan

## Hasil Pembelajaran

Setelah selesai, Anda akan mampu:
- Memilih SKU layanan Azure yang tepat berdasarkan kebutuhan dan keterbatasan beban kerja
- Merancang arsitektur multi-lingkungan yang hemat biaya dengan pemilihan tingkatan yang tepat
- Menerapkan benchmarking kinerja dan validasi untuk pilihan SKU
- Membuat alat otomatis untuk rekomendasi SKU dan optimasi biaya
- Merencanakan migrasi SKU dan strategi penskalaan untuk kebutuhan yang berubah
- Menerapkan prinsip Kerangka Kerja Azure Well-Architected pada pemilihan tingkatan layanan

## Daftar Isi

- [Memahami SKU](#understanding-skus)
- [Pemilihan Berdasarkan Lingkungan](#environment-based-selection)
- [Panduan Spesifik Layanan](#service-specific-guidelines)
- [Strategi Optimasi Biaya](#cost-optimization-strategies)
- [Pertimbangan Kinerja](#performance-considerations)
- [Tabel Referensi Cepat](#quick-reference-tables)
- [Alat Validasi](#validation-tools)

---

## Memahami SKU

> **Contoh lingkup:** Peta SKU YAML dan konfigurasi kinerja di bawah adalah catatan desain, bukan skema `azure.yaml` atau konfigurasi alat beban. Blok Bicep adalah alternatif/fragmen: deklarasikan parameter dan sumber induk mereka, gunakan nama simbolik unik saat menggabungkannya, dan sambungkan modul ke proyek yang berfungsi. Harga, batas, dan ketersediaan wilayah/SKU harus diperiksa untuk langganan Anda sebelum penerapan.

### Apa itu SKU?

SKU (Stock Keeping Units) mewakili berbagai tingkatan layanan dan tingkat kinerja untuk sumber daya Azure. Setiap SKU menawarkan berbeda:

- **Karakteristik kinerja** (CPU, memori, throughput)
- **Ketersediaan fitur** (opsi penskalaan, tingkat SLA)
- **Model harga** (berbasis konsumsi, kapasitas terpesan)
- **Ketersediaan regional** (tidak semua SKU tersedia di semua wilayah)

### Faktor Kunci dalam Pemilihan SKU

1. **Kebutuhan Beban Kerja**
   - Pola lalu lintas/beban yang diharapkan
   - Kebutuhan kinerja (CPU, memori, I/O)
   - Kebutuhan penyimpanan dan pola akses

2. **Tipe Lingkungan**
   - Pengembangan/pengujian vs produksi
   - Kebutuhan ketersediaan
   - Kebutuhan keamanan dan kepatuhan

3. **Keterbatasan Anggaran**
   - Biaya awal vs biaya operasional
   - Diskon kapasitas terpesan
   - Implikasi biaya penskalaan otomatis

4. **Proyeksi Pertumbuhan**
   - Kebutuhan skalabilitas
   - Kebutuhan fitur masa depan
   - Kompleksitas migrasi

---

## Pemilihan Berdasarkan Lingkungan

### Lingkungan Pengembangan

**Prioritas**: Optimasi biaya, fungsi dasar, penyediaan dan pencabutan mudah

#### SKU yang Direkomendasikan
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

#### Karakteristik
- **App Service**: F1 (Gratis) atau B1 (Dasar) untuk pengujian sederhana
- **Database**: tingkatan dasar dengan sumber daya minimal
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
- **Kinerja**: 70-80% dari kapasitas produksi
- **Fitur**: Sebagian besar fitur produksi diaktifkan
- **Redundansi**: Beberapa redundansi geografis
- **Penskalaan**: Penskalaan otomatis terbatas untuk pengujian
- **Pemantauan**: Tumpukan pemantauan lengkap

### Lingkungan Produksi

**Prioritas**: Kinerja, ketersediaan, keamanan, kepatuhan, skalabilitas

#### SKU yang Direkomendasikan
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

#### Karakteristik
- **Ketersediaan tinggi**: kebutuhan SLA 99,9%+
- **Kinerja**: Sumber daya khusus, throughput tinggi
- **Keamanan**: Fitur keamanan premium
- **Penskalaan**: Kemampuan penskalaan otomatis penuh
- **Pemantauan**: Observabilitas menyeluruh

---

## Panduan Spesifik Layanan

### Azure App Service

#### Matriks Keputusan SKU

| Kasus Penggunaan | SKU yang Direkomendasikan | Alasan |
|----------|----------------|-----------|
| Pengembangan/Pengujian | F1 (Gratis) atau B1 (Dasar) | Hemat biaya, cukup untuk pengujian |
| Aplikasi produksi kecil | S1 (Standar) | Domain khusus, SSL, penskalaan otomatis |
| Aplikasi produksi menengah | P1V3 (Premium V3) | Kinerja lebih baik, lebih banyak fitur |
| Aplikasi lalu lintas tinggi | P2V3 atau P3V3 | Sumber daya khusus, kinerja tinggi |
| Aplikasi misi kritikal | I1V2 (Isolated V2) | Isolasi jaringan, perangkat keras khusus |

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
   - **Premium**: P1-P15 (125-4000 DTU) - Kritis kinerja

2. **Berbasis vCore** (Direkomendasikan untuk produksi)
   - **Tujuan Umum**: Komputasi dan penyimpanan seimbang
   - **Bisnis Kritis**: Latensi rendah, IOPS tinggi
   - **Hyperscale**: Penyimpanan sangat skalabel; verifikasi batas ukuran saat ini dan dukungan regional

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

2. **Dedikasi (Profil Beban Kerja)**
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

**Produksi (Dedikasi)**
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

Redundansi zona juga memerlukan infrastruktur wilayah yang didukung dan konfigurasi VNet/subnet yang sesuai, tidak disertakan di sini. Contoh ini menganggarkan tiga node khusus; konfigurasikan setidaknya dua replika aplikasi untuk distribusi lintas zona dan ukur replika serta node untuk kegagalan zona. Lihat [Panduan keandalan Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Untuk menempatkan aplikasi pada profil ini, tetapkan `workloadProfileName: 'production-profile'`; membuat profil saja tidak memindahkan aplikasi ke situ.

### Azure Cosmos DB

#### Model Throughput

1. **Provisioned Throughput Manual**
   - Kinerja yang dapat diprediksi
   - Diskon kapasitas terpesan
   - Terbaik untuk beban kerja stabil

2. **Provisioned Throughput Autoscale**
   - Penskalaan otomatis berdasarkan penggunaan
   - Bayar sesuai penggunaan (dengan minimum)
   - Baik untuk beban kerja variabel

3. **Serverless**
   - Bayar per permintaan
   - Tidak ada throughput yang diprovisi
   - Ideal untuk pengembangan dan beban kerja sporadis

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
2. **Standard_GRS** - Produksi, butuh geo-redundansi
3. **Premium_LRS** - Aplikasi berkinerja tinggi
4. **Premium_ZRS** - Ketersediaan tinggi dengan redundansi zona

#### Tingkat Kinerja

- **Standar**: Tujuan umum, hemat biaya
- **Premium**: Skenario kinerja tinggi, latensi rendah

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

### 1. Kapasitas Terpesan

Pesan sumber daya selama 1-3 tahun untuk diskon signifikan:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Penawaran reservasi dan jenis sumber daya yang memenuhi syarat bervariasi; periksa katalog dan syarat pembelian daripada mengasumsikan setiap layanan/SKU mendukung reservasi.

### 2. Penyesuaian Ukuran (Right-Sizing)

Mulailah dengan SKU yang lebih kecil dan tingkatkan berdasarkan penggunaan nyata:

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

### 3. Konfigurasi Penskalaan Otomatis

Terapkan penskalaan cerdas untuk optimalkan biaya:

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

### 4. Penskalaan Terjadwal

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

### Kebutuhan Kinerja Dasar

Tetapkan kebutuhan kinerja yang jelas sebelum pemilihan SKU:

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
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
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

## Tabel Referensi Cepat

### Referensi Cepat SKU App Service

| SKU | Tingkat | vCPU | RAM | Penyimpanan | Kisaran Harga | Kasus Penggunaan |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Gratis | Shared | 1GB | 1GB | Gratis | Pengembangan |
| B1 | Dasar | 1 | 1,75GB | 10GB | $ | Aplikasi kecil |
| S1 | Standar | 1 | 1,75GB | 50GB | $$ | Produksi |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Kinerja tinggi |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Perusahaan |

### Referensi Cepat SKU SQL Database

| SKU | Tingkat | DTU/vCore | Penyimpanan | Kisaran Harga | Kasus Penggunaan |
|-----|------|-----------|---------|-------------|----------|
| Basic | Dasar | 5 DTU | 2GB | $ | Pengembangan |
| S2 | Standar | 50 DTU | 250GB | $$ | Produksi kecil |
| P2 | Premium | 250 DTU | 1TB | $$$ | Kinerja tinggi |
| GP_Gen5_4 | Tujuan Umum | 4 vCore | 4TB | $$$ | Seimbang |
| BC_Gen5_8 | Bisnis Kritis | 8 vCore | 4TB | $$$$ | Misi kritikal |

### Referensi Cepat SKU Container Apps

| Model | Harga | CPU/Memori | Kasus Penggunaan |
|-------|---------|------------|----------|
| Konsumsi | Bayar sesuai penggunaan | Kombinasi CPU/memori yang didukung bergantung pada lingkungan/profil | Pengembangan atau produksi, beban bervariasi |
| Dedicated D4 | Tagihan node khusus | 4 vCPU, 16GiB per node | Beban berkelanjutan/kebutuhan isolasi |
| Dedicated D8 | Tagihan node khusus | 8 vCPU, 32GiB per node | Beban berkelanjutan lebih tinggi |

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

### Skrip Estimasi Biaya

**Pseudocode saja:** `Get-ResourceCost` di bawah adalah fungsi spesifik proyek yang harus Anda implementasikan menggunakan harga regional/kontrak saat ini dan asumsi penggunaan. Ini bukan cmdlet PowerShell atau Azure.

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

YAML berikut adalah sketsa kebutuhan, **bukan** skema input Azure Load Testing, JMeter, Locust, atau k6. Terjemahkan ke dalam konfigurasi alat pilihan Anda sebelum menggunakan perintah load-test di atas.

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

### Yang Perlu Dilakukan

1. **Mulai kecil dan tingkatkan** berdasarkan penggunaan nyata
2. **Gunakan SKU berbeda untuk lingkungan berbeda**
3. **Pemantauan kinerja dan biaya secara berkelanjutan**
4. **Manfaatkan kapasitas terpesan untuk beban kerja produksi**
5. **Terapkan penskalaan otomatis bila sesuai**
6. **Uji kinerja dengan beban kerja realistis**
7. **Rencanakan pertumbuhan tapi hindari over-provisioning**
8. **Gunakan tingkatan gratis untuk pengembangan bila memungkinkan**

### Yang Tidak Perlu Dilakukan

1. **Jangan gunakan SKU produksi untuk pengembangan**
2. **Jangan abaikan ketersediaan SKU regional**
3. **Jangan lupa biaya transfer data**
4. **Jangan over-provision tanpa alasan**
5. **Jangan abaikan dampak ketergantungan**
6. **Jangan tetapkan batas penskalaan otomatis terlalu tinggi**
7. **Jangan lupa kebutuhan kepatuhan**
8. **Jangan buat keputusan hanya berdasar harga**

---

**Tips Pro**: Gunakan Azure Cost Management dan Advisor untuk mendapatkan rekomendasi personalisasi dalam mengoptimalkan pilihan SKU Anda berdasarkan pola penggunaan nyata.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Perencanaan Kapasitas](capacity-planning.md)
- **Pelajaran Berikutnya**: [Pemeriksaan Pra-penerbangan](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->