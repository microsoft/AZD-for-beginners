# Panduan Pemilihan SKU - Memilih Tahap Perkhidmatan Azure yang Betul

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 6 - Pengesahan & Perancangan Pra-Penerapan
- **⬅️ Sebelumnya**: [Perancangan Kapasiti](capacity-planning.md)
- **➡️ Seterusnya**: [Pemeriksaan Pra-Penerbangan](preflight-checks.md)
- **🚀 Bab Berikutnya**: [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/common-issues.md)

## Pengenalan

Panduan menyeluruh ini membantu anda memilih SKU (Unit Penyimpanan Stok) perkhidmatan Azure yang optimum untuk persekitaran, beban kerja, dan keperluan yang berbeza. Belajar menganalisis keperluan prestasi, pertimbangan kos, dan keperluan skala untuk memilih tahap perkhidmatan yang paling sesuai bagi penyebaran Azure Developer CLI anda.

## Matlamat Pembelajaran

Dengan menyelesaikan panduan ini, anda akan:
- Memahami konsep SKU Azure, model harga, dan perbezaan ciri
- Menguasai strategi pemilihan SKU khusus persekitaran untuk pembangunan, pemeriksaan dan produksi
- Menganalisis keperluan beban kerja dan memadankan dengan tahap perkhidmatan yang sesuai
- Melaksanakan strategi pengoptimuman kos melalui pemilihan SKU pintar
- Menerapkan teknik pengujian prestasi dan pengesahan untuk pilihan SKU
- Mengkonfigurasi cadangan SKU automatik dan pemantauan

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Memilih SKU perkhidmatan Azure yang sesuai berdasarkan keperluan dan kekangan beban kerja
- Merekabentuk seni bina multi-persekitaran yang berkesan kos dengan pemilihan tahap yang betul
- Melaksanakan penanda aras prestasi dan pengesahan untuk pilihan SKU
- Mencipta alat automatik untuk cadangan SKU dan pengoptimuman kos
- Merancang migrasi SKU dan strategi peningkatan untuk keperluan yang berubah
- Menerapkan prinsip Rangka Kerja Azure Well-Architected pada pemilihan tahap perkhidmatan

## Jadual Kandungan

- [Memahami SKU](#understanding-skus)
- [Pemilihan Berdasarkan Persekitaran](#environment-based-selection)
- [Garis Panduan Khusus Perkhidmatan](#service-specific-guidelines)
- [Strategi Pengoptimuman Kos](#cost-optimization-strategies)
- [Pertimbangan Prestasi](#performance-considerations)
- [Jadual Rujukan Pantas](#quick-reference-tables)
- [Alat Pengesahan](#validation-tools)

---

## Memahami SKU

> **Contoh skop:** Peta SKU YAML dan konfigurasi prestasi di bawah adalah nota reka bentuk, bukan `azure.yaml` skema atau konfigurasi alat beban. Blok Bicep adalah alternatif/fragmen: nyatakan parameter dan sumber induknya, gunakan nama simbolik unik apabila menggabungkannya, dan sambungkan modul ke projek yang berfungsi. Harga, had, dan ketersediaan wilayah/SKU mesti diperiksa untuk langganan anda sebelum penerapan.

### Apakah itu SKU?

SKU (Unit Penyimpanan Stok) mewakili tahap perkhidmatan dan tahap prestasi yang berbeza untuk sumber Azure. Setiap SKU menawarkan:

- **Ciri prestasi** (CPU, memori, kelajuan)
- **Ketersediaan ciri** (pilihan skala, tahap SLA)
- **Model harga** (berdasarkan penggunaan, kapasiti berrezab)
- **Ketersediaan wilayah** (tidak semua SKU tersedia di semua wilayah)

### Faktor Utama dalam Pemilihan SKU

1. **Keperluan Beban Kerja**
   - Corak trafik/beban yang dijangka
   - Keperluan prestasi (CPU, memori, I/O)
   - Keperluan storan dan corak akses

2. **Jenis Persekitaran**
   - Pembangunan/ujian berbanding produksi
   - Keperluan ketersediaan
   - Keperluan keselamatan dan pematuhan

3. **Kekangan Bajet**
   - Kos awal berbanding kos operasi
   - Diskaun kapasiti berrezab
   - Implikasi kos auto-scaling

4. **Unjuran Pertumbuhan**
   - Keperluan kebolehpambesaran
   - Keperluan ciri masa depan
   - Kompleksiti migrasi

---

## Pemilihan Berdasarkan Persekitaran

### Persekitaran Pembangunan

**Keutamaan**: Pengoptimuman kos, fungsi asas, penyediaan/penghapusan mudah

#### SKU Disyorkan
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

#### Ciri-ciri
- **Perkhidmatan Aplikasi**: F1 (Percuma) atau B1 (Asas) untuk ujian mudah
- **Pangkalan Data**: Tahap asas dengan sumber minimum
- **Storan**: Standard dengan redundansi tempatan sahaja
- **Pengkomputeran**: Sumber dikongsi boleh diterima
- **Rangkaian**: Konfigurasi asas

### Persekitaran Pemeriksaan/Ujian

**Keutamaan**: Konfigurasi menyerupai produksi, keseimbangan kos, keupayaan ujian prestasi

#### SKU Disyorkan
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
- **Prestasi**: 70-80% kapasiti produksi
- **Ciri**: Kebanyakan ciri produksi diaktifkan
- **Redundansi**: Beberapa redundansi geografi
- **Penskalaan**: Auto-scaling terhad untuk ujian
- **Pemantauan**: Tumpukan pemantauan penuh

### Persekitaran Produksi

**Keutamaan**: Prestasi, ketersediaan, keselamatan, pematuhan, kebolehpambesaran

#### SKU Disyorkan
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

#### Ciri-ciri
- **Ketersediaan tinggi**: Keperluan SLA 99.9%+
- **Prestasi**: Sumber berdedikasi, kelajuan tinggi
- **Keselamatan**: Ciri keselamatan premium
- **Penskalaan**: Keupayaan auto-scaling penuh
- **Pemantauan**: Kebolehpantauan menyeluruh

---

## Garis Panduan Khusus Perkhidmatan

### Azure App Service

#### Matriks Keputusan SKU

| Kes Penggunaan | SKU Disyorkan | Alasannya |
|--------------|---------------|-------------|
| Pembangunan/Ujian | F1 (Percuma) atau B1 (Asas) | Berkesan kos, mencukupi untuk ujian |
| Aplikasi produksi kecil | S1 (Standard) | Domain tersuai, SSL, auto-scaling |
| Aplikasi produksi sederhana | P1V3 (Premium V3) | Prestasi lebih baik, lebih banyak ciri |
| Aplikasi trafik tinggi | P2V3 atau P3V3 | Sumber berdedikasi, prestasi tinggi |
| Aplikasi kritikal misi | I1V2 (Isolated V2) | Pengasingan rangkaian, perkakasan berdedikasi |

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

1. **Berasaskan DTU (Unit Transaksi Pangkalan Data)**
   - **Asas**: 5 DTU - Pembangunan/ujian
   - **Standard**: S0-S12 (10-3000 DTU) - Tujuan umum
   - **Premium**: P1-P15 (125-4000 DTU) - Kritikal prestasi

2. **Berasaskan vCore** (Disyorkan untuk produksi)
   - **Tujuan Umum**: Imbangan pengkomputeran dan storan
   - **Kritikal Perniagaan**: Latensi rendah, IOPS tinggi
   - **Hyperscale**: Storan sangat skala; sahkan had saiz dan sokongan wilayah terkini

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

1. **Berasaskan Penggunaan**
   - Harga bayar ikut guna
   - Sesuai untuk pembangunan dan beban kerja berubah-ubah
   - Infrastruktur dikongsi

2. **Berdedikasi (Profil Beban Kerja)**
   - Sumber pengkomputeran berdedikasi
   - Prestasi boleh diramal
   - Lebih sesuai untuk beban kerja produksi

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

**Produksi (Berdedikasi)**
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

Redundansi zon juga memerlukan infrastruktur wilayah disokong dan konfigurasi VNet/subnet yang sesuai, tidak disertakan di sini. Contoh ini memperuntukkan tiga nod berdedikasi; konfigurasi sekurang-kurangnya dua replika aplikasi untuk pengagihan silang-zon dan saiz kedua-dua replika serta nod untuk kegagalan zon. Lihat [panduan kebolehpercayaan Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Untuk meletakkan aplikasi pada profil ini, tetapkan `workloadProfileName: 'production-profile'`; hanya mencipta profil tidak mengalihkan aplikasi kepadanya.

### Azure Cosmos DB

#### Model Kelajuan

1. **Kelajuan Berreser Manual**
   - Prestasi boleh diramal
   - Diskaun kapasiti berrezab
   - Sesuai untuk beban kerja stabil

2. **Kelajuan Berreser Automatik**
   - Skala automatik berdasarkan penggunaan
   - Bayar mengikut guna (dengan minimum)
   - Sesuai untuk beban kerja berubah-ubah

3. **Serverless**
   - Bayar-per-permintaan
   - Tiada kelajuan berreser
   - Ideal untuk pembangunan dan beban kerja berkala

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

### Akaun Storan Azure

#### Jenis Akaun Storan

1. **Standard_LRS** - Pembangunan, data tidak kritikal
2. **Standard_GRS** - Produksi, memerlukan geo-redundansi
3. **Premium_LRS** - Aplikasi berprestasi tinggi
4. **Premium_ZRS** - Ketersediaan tinggi dengan redundansi zon

#### Tahap Prestasi

- **Standard**: Tujuan umum, berkesan kos
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

### 1. Kapasiti Berrezab

Tempah sumber untuk 1-3 tahun bagi diskaun yang ketara:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Tawaran reservasi dan jenis sumber yang layak berbeza; periksa katalog dan terma pembelian daripada menganggap setiap perkhidmatan/SKU menyokong reservasi.

### 2. Pemadanan Saiz yang Betul

Mulakan dengan SKU lebih kecil dan tingkatkan berdasarkan penggunaan sebenar:

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

### 4. Penjadualan Penskalaan

Skala turun pada waktu tidak sibuk:

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
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Pemantauan dan Pengoptimuman

Sediakan pemantauan menyeluruh:

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

## Jadual Rujukan Pantas

### Rujukan Pantas SKU App Service

| SKU | Tahap | vCPU | RAM | Storan | Julat Harga | Kes Penggunaan |
|-----|-------|------|-----|--------|-------------|----------------|
| F1 | Percuma | Dikongsi | 1GB | 1GB | Percuma | Pembangunan |
| B1 | Asas | 1 | 1.75GB | 10GB | $ | Aplikasi kecil |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produksi |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Prestasi tinggi |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Perusahaan |

### Rujukan Pantas SKU Pangkalan Data SQL

| SKU | Tahap | DTU/vCore | Storan | Julat Harga | Kes Penggunaan |
|-----|-------|-----------|--------|-------------|----------------|
| Asas | Asas | 5 DTU | 2GB | $ | Pembangunan |
| S2 | Standard | 50 DTU | 250GB | $$ | Produksi kecil |
| P2 | Premium | 250 DTU | 1TB | $$$ | Prestasi tinggi |
| GP_Gen5_4 | Tujuan Umum | 4 vCore | 4TB | $$$ | Seimbang |
| BC_Gen5_8 | Kritikal Perniagaan | 8 vCore | 4TB | $$$$ | Kritikal misi |

### Rujukan Pantas SKU Container Apps

| Model | Harga | CPU/Memori | Kes Penggunaan |
|-------|-------|------------|----------------|
| Penggunaan | Bayar-per-guna | Gabungan CPU/memori disokong bergantung pada persekitaran/profil | Pembangunan atau produksi, beban berubah-ubah |
| Berdedikasi D4 | Pengebilan nod berdedikasi | 4 vCPU, 16GiB per nod | Beban berterusan/kebutuhan pengasingan |
| Berdedikasi D8 | Pengebilan nod berdedikasi | 8 vCPU, 32GiB per nod | Beban berterusan lebih tinggi |

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

### Skrip Anggaran Kos

**Pseudokod sahaja:** `Get-ResourceCost` di bawah adalah fungsi spesifik projek yang perlu anda laksanakan menggunakan harga dan anggaran penggunaan wilayah/kontrak terkini. Ia bukan cmdlet PowerShell atau Azure.

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

YAML berikut adalah lakaran keperluan, **bukan** skema input Azure Load Testing, JMeter, Locust, atau k6. Terjemahkan ia ke konfigurasi sebenar alat pilihan anda sebelum menggunakan arahan load-test di atas.

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

### Perkara Yang Perlu Dilakukan

1. **Mula kecil dan tingkatkan** berdasarkan penggunaan sebenar
2. **Gunakan SKU berbeza untuk persekitaran berbeza**
3. **Pantau prestasi dan kos secara berterusan**
4. **Manfaatkan kapasiti berrezab untuk beban kerja produksi**
5. **Laksanakan auto-scaling jika sesuai**
6. **Uji prestasi dengan beban kerja realistik**
7. **Rancang untuk pertumbuhan tetapi elakkan pemebasan berlebihan**
8. **Gunakan tahap percuma untuk pembangunan apabila mungkin**

### Perkara Yang Tidak Perlu Dilakukan

1. **Jangan gunakan SKU produksi untuk pembangunan**
2. **Jangan abaikan ketersediaan SKU wilayah**
3. **Jangan lupa kos pemindahan data**
4. **Jangan terlalu berlebihan tanpa justifikasi**
5. **Jangan abaikan kesan pergantungan**
6. **Jangan tetapkan had auto-scaling terlalu tinggi**
7. **Jangan lupa keperluan pematuhan**
8. **Jangan buat keputusan berasaskan harga sahaja**

---

**Petua Pakar**: Gunakan Pengurusan Kos Azure dan Advisor untuk mendapatkan cadangan peribadi bagi mengoptimumkan pemilihan SKU anda berdasarkan corak penggunaan sebenar.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Perancangan Kapasiti](capacity-planning.md)
- **Pelajaran Seterusnya**: [Pemeriksaan Pra-Penerbangan](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->