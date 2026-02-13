# Panduan Pemilihan SKU - Memilih Peringkat Perkhidmatan Azure yang Betul

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 6 - Pengesahan & Perancangan Pra-Pengeluaran
- **⬅️ Sebelumnya**: [Capacity Planning](capacity-planning.md)
- **➡️ Seterusnya**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Bab Seterusnya**: [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/common-issues.md)

## Pengenalan

Panduan komprehensif ini membantu anda memilih SKU (Stock Keeping Units) perkhidmatan Azure yang optimum untuk persekitaran, beban kerja, dan keperluan yang berbeza. Pelajari cara menganalisis keperluan prestasi, pertimbangan kos, dan keperluan kebolehskalaan untuk memilih peringkat perkhidmatan yang paling sesuai bagi pengedaran Azure Developer CLI anda.

## Matlamat Pembelajaran

Dengan menyelesaikan panduan ini, anda akan:
- Memahami konsep SKU Azure, model harga, dan perbezaan ciri
- Menguasai strategi pemilihan SKU khusus persekitaran untuk pembangunan, staging, dan pengeluaran
- Menganalisis keperluan beban kerja dan memadankannya kepada peringkat perkhidmatan yang sesuai
- Melaksanakan strategi pengoptimuman kos melalui pemilihan SKU yang bijak
- Mengaplikasikan teknik pengujian prestasi dan pengesahan untuk pilihan SKU
- Mengkonfigurasi cadangan SKU automatik dan pemantauan

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Memilih SKU perkhidmatan Azure yang sesuai berdasarkan keperluan dan kekangan beban kerja
- Mereka bentuk seni bina berbilang persekitaran yang menjimatkan kos dengan pemilihan peringkat yang betul
- Melaksanakan penanda aras prestasi dan pengesahan untuk pilihan SKU
- Mewujudkan alat automatik untuk cadangan SKU dan pengoptimuman kos
- Merancang migrasi SKU dan strategi penskalaan untuk keperluan yang berubah
- Mengaplikasikan prinsip Rangka Kerja Azure Well-Architected kepada pemilihan peringkat perkhidmatan

## Isi Kandungan

- [Memahami SKU](../../../../docs/chapter-06-pre-deployment)
- [Pemilihan Berdasarkan Persekitaran](../../../../docs/chapter-06-pre-deployment)
- [Garis Panduan Spesifik Perkhidmatan](../../../../docs/chapter-06-pre-deployment)
- [Strategi Pengoptimuman Kos](../../../../docs/chapter-06-pre-deployment)
- [Pertimbangan Prestasi](../../../../docs/chapter-06-pre-deployment)
- [Jadual Rujukan Pantas](../../../../docs/chapter-06-pre-deployment)
- [Alat Pengesahan](../../../../docs/chapter-06-pre-deployment)

---

## Memahami SKU

### Apa itu SKU?

SKU (Stock Keeping Units) mewakili peringkat perkhidmatan dan tahap prestasi yang berbeza untuk sumber Azure. Setiap SKU menawarkan perbezaan dalam:

- **Ciri-ciri prestasi** (CPU, memori, throughput)
- **Ketersediaan ciri** (pilihan penskalaan, tahap SLA)
- **Model harga** (berdasarkan penggunaan, kapasiti ditempah)
- **Ketersediaan serantau** (tidak semua SKU tersedia di semua rantau)

### Faktor Utama dalam Pemilihan SKU

1. **Keperluan Beban Kerja**
   - Corak trafik/beban yang dijangka
   - Keperluan prestasi (CPU, memori, I/O)
   - Keperluan storan dan corak capaian

2. **Jenis Persekitaran**
   - Pembangunan/ujian vs. pengeluaran
   - Keperluan kebolehcapaian
   - Keperluan keselamatan dan pematuhan

3. **Kekangan Bajet**
   - Kos awal vs. kos operasi
   - Diskaun kapasiti ditempah
   - Implikasi kos penskalaan automatik

4. **Unjuran Pertumbuhan**
   - Keperluan kebolehskalaan
   - Keperluan ciri masa hadapan
   - Kompleksiti migrasi

---

## Pemilihan Berdasarkan Persekitaran

### Persekitaran Pembangunan

**Keutamaan**: Pengoptimuman kos, fungsi asas, penyediaan/pembatalan mudah

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
- **App Service**: F1 (Percuma) atau B1 (Asas) untuk ujian ringkas
- **Pangkalan Data**: Peringkat asas dengan sumber minimum
- **Storan**: Standard dengan redundansi tempatan sahaja
- **Pengkomputeran**: Sumber berkongsi boleh diterima
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
- **Pemantauan**: Tumpukan pemantauan penuh

### Persekitaran Pengeluaran

**Keutamaan**: Prestasi, kebolehcapaian, keselamatan, pematuhan, kebolehskalaan

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
- **Pemantauan**: Pemerhatian menyeluruh

---

## Garis Panduan Spesifik Perkhidmatan

### Azure App Service

#### Matriks Keputusan SKU

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### Contoh Konfigurasi

**Development**
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

**Production**
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

#### Rangka Kerja Pemilihan SKU

1. **Berasaskan DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Pembangunan/ujian
   - **Standard**: S0-S12 (10-3000 DTU) - Tujuan am
   - **Premium**: P1-P15 (125-4000 DTU) - Kritikal prestasi

2. **Berasaskan vCore** (Disyorkan untuk pengeluaran)
   - **General Purpose**: Imbangan pengkomputeran dan storan
   - **Business Critical**: Latensi rendah, IOPS tinggi
   - **Hyperscale**: Storan sangat boleh diskala (sehingga 100TB)

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
   - Harga bayar ikut penggunaan
   - Sesuai untuk pembangunan dan beban kerja berubah-ubah
   - Infrastruktur berkongsi

2. **Didedikasikan (Profil Beban Kerja)**
   - Sumber pengkomputeran berdedikasi
   - Prestasi boleh diramal
   - Lebih baik untuk beban kerja pengeluaran

#### Contoh Konfigurasi

**Pembangunan (Consumption)**
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

**Pengeluaran (Dedicated)**
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

1. **Provisioned Throughput Manual**
   - Prestasi boleh diramal
   - Diskaun kapasiti ditempah
   - Terbaik untuk beban kerja stabil

2. **Autoscale Provisioned Throughput**
   - Penskalaan automatik berdasarkan penggunaan
   - Bayar untuk apa yang anda gunakan (dengan minimum)
   - Baik untuk beban kerja berubah-ubah

3. **Serverless**
   - Bayar ikut permintaan
   - Tiada throughput yang diprovisikan
   - Ideal untuk pembangunan dan beban kerja berselang

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
3. **Premium_LRS** - Aplikasi prestasi tinggi
4. **Premium_ZRS** - Ketersediaan tinggi dengan redundansi zon

#### Peringkat Prestasi

- **Standard**: Tujuan am, kos efektif
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

### 1. Tempahan Kapasiti

Tempah sumber untuk 1-3 tahun untuk diskaun ketara:

```bash
# Semak pilihan tempahan
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Penentuan Saiz Sesuai

Mula dengan SKU yang lebih kecil dan skala naik berdasarkan penggunaan sebenar:

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

Skala turun semasa waktu tidak puncak:

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

Uji pelbagai SKU untuk mengesahkan prestasi:

```bash
# Perkhidmatan Ujian Beban Azure
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
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

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Percuma | Berkongsi | 1GB | 1GB | Percuma | Pembangunan |
| B1 | Asas | 1 | 1.75GB | 10GB | $ | Aplikasi kecil |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Pengeluaran |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Prestasi tinggi |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Perusahaan |

### Rujukan Pantas SKU Pangkalan Data SQL

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Pembangunan |
| S2 | Standard | 50 DTU | 250GB | $$ | Pengeluaran kecil |
| P2 | Premium | 250 DTU | 1TB | $$$ | Prestasi tinggi |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Seimbang |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Misi kritikal |

### Rujukan Pantas SKU Container Apps

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Bayar ikut penggunaan | 0.25-2 vCPU | Pembangunan, beban berubah-ubah |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Pengeluaran |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | Prestasi tinggi |

---

## Alat Pengesahan

### Pemeriksa Ketersediaan SKU

```bash
#!/bin/bash
# Semak ketersediaan SKU di rantau sasaran

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

# Penggunaan
check_sku_availability "eastus" "app-service" "P1V3"
```

### Skrip Anggaran Kos

```powershell
# Skrip PowerShell untuk anggaran kos
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
        
        # Gunakan Azure Pricing API atau kalkulator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Penggunaan
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

### Perkara Yang Perlu

1. **Mula kecil dan skala naik** berdasarkan penggunaan sebenar
2. **Gunakan SKU berbeza untuk persekitaran berbeza**
3. **Pantau prestasi dan kos secara berterusan**
4. **Manfaatkan kapasiti ditempah untuk beban kerja pengeluaran**
5. **Laksanakan penskalaan automatik di mana sesuai**
6. **Uji prestasi dengan beban kerja yang realistik**
7. **Rancang untuk pertumbuhan tetapi elakkan over-provisioning**
8. **Gunakan peringkat percuma untuk pembangunan apabila boleh**

### Perkara Yang Tidak Perlu

1. **Jangan gunakan SKU pengeluaran untuk pembangunan**
2. **Jangan abaikan ketersediaan SKU serantau**
3. **Jangan lupa tentang kos pemindahan data**
4. **Jangan over-provision tanpa justifikasi**
5. **Jangan abaikan impak pergantungan**
6. **Jangan tetapkan had penskalaan automatik terlalu tinggi**
7. **Jangan lupa tentang keperluan pematuhan**
8. **Jangan membuat keputusan hanya berdasarkan harga**

---

**Petua Pro**: Gunakan Azure Cost Management dan Advisor untuk mendapatkan cadangan peribadi bagi mengoptimumkan pemilihan SKU anda berdasarkan corak penggunaan sebenar.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Capacity Planning](capacity-planning.md)
- **Pelajaran Seterusnya**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha mencapai ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi ralat atau ketidakakuratan. Dokumen asal dalam bahasa aslinya harus dianggap sebagai sumber rujukan yang sah. Bagi maklumat yang kritikal, terjemahan profesional oleh penterjemah manusia adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->