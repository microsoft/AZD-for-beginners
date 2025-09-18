<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-18T08:16:48+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "ms"
}
-->
# Panduan Pemilihan SKU - Memilih Tahap Perkhidmatan Azure yang Tepat

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 6 - Pengesahan & Perancangan Pra-Pelaksanaan
- **⬅️ Sebelumnya**: [Perancangan Kapasiti](capacity-planning.md)
- **➡️ Seterusnya**: [Pemeriksaan Awal](preflight-checks.md)
- **🚀 Bab Seterusnya**: [Bab 7: Penyelesaian Masalah](../troubleshooting/common-issues.md)

## Pengenalan

Panduan komprehensif ini membantu anda memilih SKU (Stock Keeping Units) perkhidmatan Azure yang optimum untuk pelbagai persekitaran, beban kerja, dan keperluan. Pelajari cara menganalisis keperluan prestasi, pertimbangan kos, dan keperluan skalabiliti untuk memilih tahap perkhidmatan yang paling sesuai bagi pelaksanaan Azure Developer CLI anda.

## Matlamat Pembelajaran

Dengan melengkapkan panduan ini, anda akan:
- Memahami konsep SKU Azure, model harga, dan perbezaan ciri
- Menguasai strategi pemilihan SKU berdasarkan persekitaran untuk pembangunan, staging, dan pengeluaran
- Menganalisis keperluan beban kerja dan memadankannya dengan tahap perkhidmatan yang sesuai
- Melaksanakan strategi pengoptimuman kos melalui pemilihan SKU yang bijak
- Menggunakan teknik ujian prestasi dan pengesahan untuk pilihan SKU
- Mengkonfigurasi cadangan SKU automatik dan pemantauan

## Hasil Pembelajaran

Selepas selesai, anda akan dapat:
- Memilih SKU perkhidmatan Azure yang sesuai berdasarkan keperluan dan kekangan beban kerja
- Merancang seni bina pelbagai persekitaran yang kos efektif dengan pemilihan tahap yang betul
- Melaksanakan penanda aras prestasi dan pengesahan untuk pilihan SKU
- Mencipta alat automatik untuk cadangan SKU dan pengoptimuman kos
- Merancang migrasi SKU dan strategi penskalaan untuk keperluan yang berubah
- Mengaplikasikan prinsip Azure Well-Architected Framework kepada pemilihan tahap perkhidmatan

## Kandungan

- [Memahami SKU](../../../../docs/pre-deployment)
- [Pemilihan Berdasarkan Persekitaran](../../../../docs/pre-deployment)
- [Panduan Khusus Perkhidmatan](../../../../docs/pre-deployment)
- [Strategi Pengoptimuman Kos](../../../../docs/pre-deployment)
- [Pertimbangan Prestasi](../../../../docs/pre-deployment)
- [Jadual Rujukan Pantas](../../../../docs/pre-deployment)
- [Alat Pengesahan](../../../../docs/pre-deployment)

---

## Memahami SKU

### Apakah SKU?

SKU (Stock Keeping Units) mewakili tahap perkhidmatan dan tahap prestasi yang berbeza untuk sumber Azure. Setiap SKU menawarkan:

- **Ciri prestasi** (CPU, memori, throughput)
- **Ketersediaan ciri** (pilihan penskalaan, tahap SLA)
- **Model harga** (berdasarkan penggunaan, kapasiti terpelihara)
- **Ketersediaan wilayah** (tidak semua SKU tersedia di semua wilayah)

### Faktor Utama dalam Pemilihan SKU

1. **Keperluan Beban Kerja**
   - Corak trafik/beban yang dijangka
   - Keperluan prestasi (CPU, memori, I/O)
   - Keperluan storan dan corak akses

2. **Jenis Persekitaran**
   - Pembangunan/pengujian vs. pengeluaran
   - Keperluan ketersediaan
   - Keperluan keselamatan dan pematuhan

3. **Kekangan Bajet**
   - Kos awal vs. kos operasi
   - Diskaun kapasiti terpelihara
   - Implikasi kos penskalaan automatik

4. **Unjuran Pertumbuhan**
   - Keperluan skalabiliti
   - Keperluan ciri masa depan
   - Kerumitan migrasi

---

## Pemilihan Berdasarkan Persekitaran

### Persekitaran Pembangunan

**Keutamaan**: Pengoptimuman kos, fungsi asas, penyediaan/pembatalan penyediaan yang mudah

#### SKU yang Disyorkan
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

#### Ciri-ciri
- **App Service**: F1 (Percuma) atau B1 (Asas) untuk ujian mudah
- **Pangkalan Data**: Tahap asas dengan sumber minimum
- **Storan**: Standard dengan redundansi tempatan sahaja
- **Komputasi**: Sumber yang dikongsi boleh diterima
- **Rangkaian**: Konfigurasi asas

### Persekitaran Staging/Pengujian

**Keutamaan**: Konfigurasi seperti pengeluaran, keseimbangan kos, keupayaan ujian prestasi

#### SKU yang Disyorkan
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

#### Ciri-ciri
- **Prestasi**: 70-80% kapasiti pengeluaran
- **Ciri-ciri**: Kebanyakan ciri pengeluaran diaktifkan
- **Redundansi**: Beberapa redundansi geografi
- **Penskalaan**: Penskalaan automatik terhad untuk ujian
- **Pemantauan**: Stak pemantauan penuh

### Persekitaran Pengeluaran

**Keutamaan**: Prestasi, ketersediaan, keselamatan, pematuhan, skalabiliti

#### SKU yang Disyorkan
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

#### Ciri-ciri
- **Ketersediaan tinggi**: Keperluan SLA 99.9%+
- **Prestasi**: Sumber berdedikasi, throughput tinggi
- **Keselamatan**: Ciri keselamatan premium
- **Penskalaan**: Keupayaan penskalaan automatik penuh
- **Pemantauan**: Pemerhatian yang komprehensif

---

## Panduan Khusus Perkhidmatan

### Azure App Service

#### Matriks Keputusan SKU

| Kes Penggunaan | SKU yang Disyorkan | Rasional |
|----------------|--------------------|----------|
| Pembangunan/Pengujian | F1 (Percuma) atau B1 (Asas) | Kos efektif, mencukupi untuk ujian |
| Aplikasi pengeluaran kecil | S1 (Standard) | Domain tersuai, SSL, penskalaan automatik |
| Aplikasi pengeluaran sederhana | P1V3 (Premium V3) | Prestasi lebih baik, lebih banyak ciri |
| Aplikasi trafik tinggi | P2V3 atau P3V3 | Sumber berdedikasi, prestasi tinggi |
| Aplikasi kritikal | I1V2 (Isolated V2) | Pengasingan rangkaian, perkakasan berdedikasi |

#### Contoh Konfigurasi

**Pembangunan**
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

**Pengeluaran**
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

1. **Berdasarkan DTU (Database Transaction Units)**
   - **Asas**: 5 DTU - Pembangunan/pengujian
   - **Standard**: S0-S12 (10-3000 DTU) - Tujuan umum
   - **Premium**: P1-P15 (125-4000 DTU) - Kritikal prestasi

2. **Berdasarkan vCore** (Disyorkan untuk pengeluaran)
   - **Tujuan Umum**: Komputasi dan storan seimbang
   - **Kritikal Perniagaan**: Latensi rendah, IOPS tinggi
   - **Hyperscale**: Storan yang sangat skalabel (sehingga 100TB)

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

#### Jenis Persekitaran

1. **Berdasarkan Penggunaan**
   - Harga bayar mengikut penggunaan
   - Sesuai untuk pembangunan dan beban kerja berubah-ubah
   - Infrastruktur dikongsi

2. **Berdedikasi (Profil Beban Kerja)**
   - Sumber komputasi berdedikasi
   - Prestasi yang boleh diramal
   - Lebih baik untuk beban kerja pengeluaran

#### Contoh Konfigurasi

**Pembangunan (Penggunaan)**
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

**Pengeluaran (Berdedikasi)**
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

1. **Throughput Provisioned Manual**
   - Prestasi yang boleh diramal
   - Diskaun kapasiti terpelihara
   - Terbaik untuk beban kerja yang stabil

2. **Throughput Provisioned Autoscale**
   - Penskalaan automatik berdasarkan penggunaan
   - Bayar untuk apa yang digunakan (dengan minimum)
   - Baik untuk beban kerja berubah-ubah

3. **Serverless**
   - Bayar mengikut permintaan
   - Tiada throughput provisioned
   - Ideal untuk pembangunan dan beban kerja berselang-seli

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

#### Jenis Akaun Storan

1. **Standard_LRS** - Pembangunan, data tidak kritikal
2. **Standard_GRS** - Pengeluaran, memerlukan geo-redundansi
3. **Premium_LRS** - Aplikasi berprestasi tinggi
4. **Premium_ZRS** - Ketersediaan tinggi dengan redundansi zon

#### Tahap Prestasi

- **Standard**: Tujuan umum, kos efektif
- **Premium**: Prestasi tinggi, senario latensi rendah

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

## Strategi Pengoptimuman Kos

### 1. Kapasiti Terpelihara

Tempah sumber untuk 1-3 tahun untuk diskaun yang signifikan:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Saiz yang Tepat

Mulakan dengan SKU yang lebih kecil dan tingkatkan berdasarkan penggunaan sebenar:

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

### 3. Konfigurasi Penskalaan Automatik

Laksanakan penskalaan pintar untuk mengoptimumkan kos:

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

### 4. Penskalaan Berjadual

Kurangkan skala semasa waktu tidak sibuk:

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

## Pertimbangan Prestasi

### Keperluan Prestasi Asas

Tentukan keperluan prestasi yang jelas sebelum pemilihan SKU:

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

### Ujian Beban

Uji SKU yang berbeza untuk mengesahkan prestasi:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Pemantauan dan Pengoptimuman

Sediakan pemantauan yang komprehensif:

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

## Jadual Rujukan Pantas

### Rujukan Pantas SKU App Service

| SKU | Tahap | vCPU | RAM | Storan | Julat Harga | Kes Penggunaan |
|-----|-------|------|-----|--------|-------------|----------------|
| F1 | Percuma | Dikongsi | 1GB | 1GB | Percuma | Pembangunan |
| B1 | Asas | 1 | 1.75GB | 10GB | $ | Aplikasi kecil |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Pengeluaran |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Prestasi tinggi |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Perusahaan |

### Rujukan Pantas SKU SQL Database

| SKU | Tahap | DTU/vCore | Storan | Julat Harga | Kes Penggunaan |
|-----|-------|-----------|--------|-------------|----------------|
| Asas | Asas | 5 DTU | 2GB | $ | Pembangunan |
| S2 | Standard | 50 DTU | 250GB | $$ | Pengeluaran kecil |
| P2 | Premium | 250 DTU | 1TB | $$$ | Prestasi tinggi |
| GP_Gen5_4 | Tujuan Umum | 4 vCore | 4TB | $$$ | Seimbang |
| BC_Gen5_8 | Kritikal Perniagaan | 8 vCore | 4TB | $$$$ | Kritikal misi |

### Rujukan Pantas SKU Container Apps

| Model | Harga | CPU/Memori | Kes Penggunaan |
|-------|-------|------------|----------------|
| Penggunaan | Bayar mengikut penggunaan | 0.25-2 vCPU | Pembangunan, beban berubah |
| Berdedikasi D4 | Terpelihara | 4 vCPU, 16GB | Pengeluaran |
| Berdedikasi D8 | Terpelihara | 8 vCPU, 32GB | Prestasi tinggi |

---

## Alat Pengesahan

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

### Skrip Anggaran Kos

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

### Pengesahan Prestasi

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

## Ringkasan Amalan Terbaik

### Perkara yang Perlu Dilakukan

1. **Mulakan kecil dan tingkatkan** berdasarkan penggunaan sebenar
2. **Gunakan SKU yang berbeza untuk persekitaran yang berbeza**
3. **Pantau prestasi dan kos secara berterusan**
4. **Manfaatkan kapasiti terpelihara untuk beban kerja pengeluaran**
5. **Laksanakan penskalaan automatik di tempat yang sesuai**
6. **Uji prestasi dengan beban kerja yang realistik**
7. **Rancang untuk pertumbuhan tetapi elakkan penyediaan berlebihan**
8. **Gunakan tahap percuma untuk pembangunan jika boleh**

### Perkara yang Tidak Perlu Dilakukan

1. **Jangan gunakan SKU pengeluaran untuk pembangunan**
2. **Jangan abaikan ketersediaan SKU wilayah**
3. **Jangan lupa tentang kos pemindahan data**
4. **Jangan penyediaan berlebihan tanpa justifikasi**
5. **Jangan abaikan kesan pergantungan**
6. **Jangan tetapkan had penskalaan automatik terlalu tinggi**
7. **Jangan lupa tentang keperluan pematuhan**
8. **Jangan buat keputusan berdasarkan harga sahaja**

---

**Tip Profesional**: Gunakan Azure Cost Management dan Advisor untuk mendapatkan cadangan yang diperibadikan bagi mengoptimumkan pemilihan SKU anda berdasarkan corak penggunaan sebenar.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Perancangan Kapasiti](capacity-planning.md)
- **Pelajaran Seterusnya**: [Pemeriksaan Awal](preflight-checks.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.