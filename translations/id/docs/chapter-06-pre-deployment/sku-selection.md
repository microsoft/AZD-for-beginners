# Panduan Pemilihan SKU - Memilih Tingkat Layanan Azure yang Tepat

**Navigasi Bab:**
- **📚 Course Home**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 6 - Validasi & Perencanaan Pra-Penerapan
- **⬅️ Previous**: [Capacity Planning](capacity-planning.md)
- **➡️ Next**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Next Chapter**: [Bab 7: Pemecahan Masalah](../chapter-07-troubleshooting/common-issues.md)

## Pendahuluan

Panduan komprehensif ini membantu Anda memilih SKU layanan Azure (Stock Keeping Units) yang optimal untuk berbagai lingkungan, beban kerja, dan kebutuhan. Pelajari cara menganalisis kebutuhan kinerja, pertimbangan biaya, dan kebutuhan skalabilitas untuk memilih tingkat layanan yang paling sesuai untuk penerapan Azure Developer CLI Anda.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan ini, Anda akan:
- Memahami konsep SKU Azure, model harga, dan perbedaan fitur
- Menguasai strategi pemilihan SKU yang spesifik lingkungan untuk pengembangan, staging, dan produksi
- Menganalisis kebutuhan beban kerja dan mencocokkannya dengan tingkat layanan yang sesuai
- Menerapkan strategi optimasi biaya melalui pemilihan SKU yang cerdas
- Menerapkan teknik pengujian kinerja dan validasi untuk pilihan SKU
- Mengonfigurasi rekomendasi SKU otomatis dan pemantauan

## Hasil Pembelajaran

Setelah selesai, Anda akan mampu:
- Memilih SKU layanan Azure yang tepat berdasarkan kebutuhan dan keterbatasan beban kerja
- Merancang arsitektur multi-lingkungan yang hemat biaya dengan pemilihan tingkat yang tepat
- Menerapkan benchmarking kinerja dan validasi untuk pilihan SKU
- Membuat alat otomatis untuk rekomendasi SKU dan optimasi biaya
- Merencanakan migrasi SKU dan strategi penskalaan untuk kebutuhan yang berubah
- Menerapkan prinsip Azure Well-Architected Framework pada pemilihan tingkat layanan

## Daftar Isi

- [Understanding SKUs](../../../../docs/chapter-06-pre-deployment)
- [Environment-Based Selection](../../../../docs/chapter-06-pre-deployment)
- [Service-Specific Guidelines](../../../../docs/chapter-06-pre-deployment)
- [Cost Optimization Strategies](../../../../docs/chapter-06-pre-deployment)
- [Performance Considerations](../../../../docs/chapter-06-pre-deployment)
- [Quick Reference Tables](../../../../docs/chapter-06-pre-deployment)
- [Validation Tools](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### What are SKUs?

SKU (Stock Keeping Units) mewakili berbagai tingkat layanan dan tingkat kinerja untuk sumber daya Azure. Setiap SKU menawarkan perbedaan dalam:

- **Karakteristik kinerja** (CPU, memori, throughput)
- **Ketersediaan fitur** (opsi penskalaan, tingkat SLA)
- **Model penetapan harga** (berbasis konsumsi, kapasitas terpesan)
- **Ketersediaan regional** (tidak semua SKU tersedia di semua wilayah)

### Key Factors in SKU Selection

1. **Workload Requirements**
   - Pola lalu lintas/beban yang diharapkan
   - Persyaratan kinerja (CPU, memori, I/O)
   - Kebutuhan penyimpanan dan pola akses

2. **Environment Type**
   - Pengembangan/pengujian vs. produksi
   - Persyaratan ketersediaan
   - Kebutuhan keamanan dan kepatuhan

3. **Budget Constraints**
   - Biaya awal vs. biaya operasional
   - Diskon kapasitas terpesan
   - Implikasi biaya auto-scaling

4. **Growth Projections**
   - Kebutuhan skalabilitas
   - Kebutuhan fitur di masa depan
   - Kompleksitas migrasi

---

## Environment-Based Selection

### Development Environment

**Prioritas**: Optimasi biaya, fungsi dasar, penyediaan/penghapusan yang mudah

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

#### Characteristics
- **App Service**: F1 (Gratis) atau B1 (Dasar) untuk pengujian sederhana
- **Databases**: Tingkat Basic dengan sumber daya minimal
- **Storage**: Standard dengan redundansi lokal saja
- **Compute**: Sumber daya bersama dapat diterima
- **Networking**: Konfigurasi dasar

### Staging/Testing Environment

**Prioritas**: Konfigurasi mirip produksi, keseimbangan biaya, kemampuan pengujian kinerja

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

#### Characteristics
- **Performance**: 70-80% dari kapasitas produksi
- **Features**: Sebagian besar fitur produksi diaktifkan
- **Redundancy**: Beberapa redundansi geografis
- **Scaling**: Auto-scaling terbatas untuk pengujian
- **Monitoring**: Stack pemantauan penuh

### Production Environment

**Prioritas**: Kinerja, ketersediaan, keamanan, kepatuhan, skalabilitas

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

#### Characteristics
- **High availability**: Persyaratan SLA 99,9%+
- **Performance**: Sumber daya khusus, throughput tinggi
- **Security**: Fitur keamanan premium
- **Scaling**: Kemampuan auto-scaling penuh
- **Monitoring**: Observabilitas komprehensif

---

## Service-Specific Guidelines

### Azure App Service

#### SKU Decision Matrix

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Gratis) atau B1 (Dasar) | Hemat biaya, cukup untuk pengujian |
| Small production apps | S1 (Standard) | Domain kustom, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Kinerja lebih baik, lebih banyak fitur |
| High-traffic apps | P2V3 atau P3V3 | Sumber daya khusus, kinerja tinggi |
| Mission-critical apps | I1V2 (Isolated V2) | Isolasi jaringan, perangkat keras khusus |

#### Configuration Examples

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

#### SKU Selection Framework

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - Pengembangan/pengujian
   - **Standard**: S0-S12 (10-3000 DTU) - Tujuan umum
   - **Premium**: P1-P15 (125-4000 DTU) - Kinerja-krusial

2. **vCore-based** (Direkomendasikan untuk produksi)
   - **General Purpose**: Seimbang antara compute dan penyimpanan
   - **Business Critical**: Latensi rendah, IOPS tinggi
   - **Hyperscale**: Penyimpanan sangat skalabel (hingga 100TB)

#### Example Configurations

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

#### Environment Types

1. **Consumption-based**
   - Pembayaran sesuai penggunaan
   - Cocok untuk pengembangan dan beban kerja variabel
   - Infrastruktur bersama

2. **Dedicated (Workload Profiles)**
   - Sumber daya komputasi khusus
   - Performa yang dapat diprediksi
   - Lebih baik untuk beban kerja produksi

#### Configuration Examples

**Development (Consumption)**
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

**Production (Dedicated)**
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

#### Throughput Models

1. **Manual Provisioned Throughput**
   - Performa yang dapat diprediksi
   - Diskon kapasitas terpesan
   - Terbaik untuk beban kerja stabil

2. **Autoscale Provisioned Throughput**
   - Penskalaan otomatis berdasarkan penggunaan
   - Bayar sesuai yang Anda gunakan (dengan minimum)
   - Baik untuk beban kerja yang bervariasi

3. **Serverless**
   - Bayar per permintaan
   - Tidak ada throughput yang diprovisikan
   - Ideal untuk pengembangan dan beban kerja intermittant

#### SKU Examples

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

#### Storage Account Types

1. **Standard_LRS** - Pengembangan, data non-kritis
2. **Standard_GRS** - Produksi, diperlukan geo-redundansi
3. **Premium_LRS** - Aplikasi berkinerja tinggi
4. **Premium_ZRS** - Ketersediaan tinggi dengan redundansi zona

#### Performance Tiers

- **Standard**: Serba guna, hemat biaya
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

## Cost Optimization Strategies

### 1. Reserved Capacity

Pesan sumber daya untuk 1-3 tahun untuk diskon signifikan:

```bash
# Periksa opsi reservasi
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

Mulai dengan SKU yang lebih kecil dan skala naik berdasarkan penggunaan nyata:

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

### 3. Auto-Scaling Configuration

Terapkan penskalaan cerdas untuk mengoptimalkan biaya:

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

### 4. Scheduled Scaling

Skala turun selama jam tidak sibuk:

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

## Performance Considerations

### Baseline Performance Requirements

Tentukan persyaratan kinerja yang jelas sebelum pemilihan SKU:

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

### Load Testing

Uji berbagai SKU untuk memvalidasi kinerja:

```bash
# Layanan Pengujian Beban Azure
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring and Optimization

Atur pemantauan komprehensif:

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

## Quick Reference Tables

### App Service SKU Quick Reference

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Gratis | Shared | 1GB | 1GB | Free | Pengembangan |
| B1 | Dasar | 1 | 1.75GB | 10GB | $ | Aplikasi kecil |
| S1 | Standar | 1 | 1.75GB | 50GB | $$ | Produksi |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Kinerja tinggi |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Perusahaan |

### SQL Database SKU Quick Reference

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Pengembangan |
| S2 | Standard | 50 DTU | 250GB | $$ | Produksi kecil |
| P2 | Premium | 250 DTU | 1TB | $$$ | Kinerja tinggi |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Seimbang |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Misi kritis |

### Container Apps SKU Quick Reference

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Pengembangan, beban variabel |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Produksi |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | Kinerja tinggi |

---

## Validation Tools

### SKU Availability Checker

```bash
#!/bin/bash
# Periksa ketersediaan SKU di wilayah tujuan

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

### Cost Estimation Script

```powershell
# Skrip PowerShell untuk estimasi biaya
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

## Best Practices Summary

### Do's

1. **Start small and scale up** berdasarkan penggunaan nyata
2. **Use different SKUs for different environments**
3. **Monitor performance and costs continuously**
4. **Leverage reserved capacity for production workloads**
5. **Implement auto-scaling where appropriate**
6. **Test performance with realistic workloads**
7. **Plan for growth but avoid over-provisioning**
8. **Use free tiers for development when possible**

### Don'ts

1. **Don't use production SKUs for development**
2. **Don't ignore regional SKU availability**
3. **Don't forget about data transfer costs**
4. **Don't over-provision without justification**
5. **Don't ignore the impact of dependencies**
6. **Don't set auto-scaling limits too high**
7. **Don't forget about compliance requirements**
8. **Don't make decisions based on price alone**

---

**Tip Pro**: Gunakan Azure Cost Management dan Advisor untuk mendapatkan rekomendasi yang dipersonalisasi dalam mengoptimalkan pemilihan SKU berdasarkan pola penggunaan nyata.

---

**Navigation**
- **Previous Lesson**: [Capacity Planning](capacity-planning.md)
- **Next Lesson**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai akurasi, harap diperhatikan bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->