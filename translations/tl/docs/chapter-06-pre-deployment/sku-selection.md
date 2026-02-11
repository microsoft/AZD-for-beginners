# Gabay sa Pagpili ng SKU - Pagpili ng Tamang Mga Antas ng Serbisyo ng Azure

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 6 - Pagpapatunay at Pagpaplano Bago ang Deployment
- **⬅️ Nakaraan**: [Pagpaplano ng Kapasidad](capacity-planning.md)
- **➡️ Susunod**: [Paunang Pagsusuri](preflight-checks.md)
- **🚀 Susunod na Kabanata**: [Kabanata 7: Paglutas ng Mga Karaniwang Suliranin](../chapter-07-troubleshooting/common-issues.md)

## Panimula

Nakakatulong ang komprehensibong gabay na ito sa pagpili ng pinakamainam na Azure service SKUs (Stock Keeping Units) para sa iba't ibang kapaligiran, workload, at mga kinakailangan. Matutunan kung paano suriin ang mga pangangailangan sa pagganap, konsiderasyon sa gastos, at mga kinakailangan sa scalability upang piliin ang pinakaangkop na mga antas ng serbisyo para sa iyong mga deployment gamit ang Azure Developer CLI.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito, ikaw ay:
- Mauunawaan ang mga konsepto ng Azure SKU, mga modelo ng pagpepresyo, at pagkakaiba ng mga tampok
- Mahahasa sa mga estratehiya ng pagpili ng SKU batay sa kapaligiran para sa pag-develop, staging, at produksyon
- Masusuri ang mga kinakailangan ng workload at itutugma ang mga ito sa angkop na antas ng serbisyo
- Magpapatupad ng mga estratehiya sa pag-optimize ng gastos sa pamamagitan ng matalinong pagpili ng SKU
- Mag-aaplay ng mga pamamaraan sa pagsubok ng pagganap at pagpapatunay para sa mga pagpili ng SKU
- Makokonpigura ang mga automated na rekomendasyon ng SKU at pagmamanman

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto, maaari kang:
- Pumili ng angkop na Azure service SKUs batay sa mga kinakailangan at limitasyon ng workload
- Magdisenyo ng makatipid na multi-environment na arkitektura na may tamang pagpili ng mga antas
- Magpatupad ng benchmarking ng pagganap at pagpapatunay para sa mga pagpili ng SKU
- Lumikha ng mga automated na tool para sa rekomendasyon ng SKU at pag-optimize ng gastos
- Magplano ng mga migrasyon ng SKU at mga estratehiya sa pag-scale para sa nagbabagong kinakailangan
- Mag-apply ng mga prinsipyo ng Azure Well-Architected Framework sa pagpili ng antas ng serbisyo

## Talaan ng Nilalaman

- [Pag-unawa sa mga SKU](../../../../docs/chapter-06-pre-deployment)
- [Pagpili Batay sa Kapaligiran](../../../../docs/chapter-06-pre-deployment)
- [Mga Patnubay para sa Bawat Serbisyo](../../../../docs/chapter-06-pre-deployment)
- [Mga Estratehiya sa Pag-optimize ng Gastos](../../../../docs/chapter-06-pre-deployment)
- [Mga Isinasaalang-alang sa Pagganap](../../../../docs/chapter-06-pre-deployment)
- [Mabilis na Sanggunian na Mga Talahanayan](../../../../docs/chapter-06-pre-deployment)
- [Mga Tool sa Pagpapatunay](../../../../docs/chapter-06-pre-deployment)

---

## Pag-unawa sa mga SKU

### Ano ang mga SKU?

Ang mga SKU (Stock Keeping Units) ay kumakatawan sa iba't ibang antas ng serbisyo at mga antas ng pagganap para sa mga Azure resource. Bawat SKU ay nag-aalok ng iba't ibang:

- **Mga katangian ng pagganap** (CPU, memory, throughput)
- **Pagkakaroon ng tampok** (mga opsyon sa scaling, antas ng SLA)
- **Mga modelo ng pagpepresyo** (batay sa consumption, reserved capacity)
- **Pagkakaroon ayon sa rehiyon** (hindi lahat ng SKU ay magagamit sa lahat ng mga rehiyon)

### Mga Pangunahing Salik sa Pagpili ng SKU

1. **Mga Kinakailangan ng Workload**
   - Inaasahang mga pattern ng trapiko/load
   - Mga kinakailangan sa pagganap (CPU, memory, I/O)
   - Mga pangangailangan sa storage at mga pattern ng pag-access

2. **Uri ng Kapaligiran**
   - Pag-develop/pagsusuri kumpara sa produksyon
   - Mga kinakailangan sa availability
   - Pangangailangan sa seguridad at pagsunod sa regulasyon

3. **Mga Limitasyon sa Badyet**
   - Mga paunang gastos kumpara sa mga operational na gastos
   - Mga diskwento para sa reserved capacity
   - Mga implikasyon ng auto-scaling sa gastos

4. **Proyeksyon ng Paglago**
   - Mga kinakailangan sa scalability
   - Mga hinaharap na pangangailangan sa tampok
   - Kahirapan sa migrasyon

---

## Pagpili Batay sa Kapaligiran

### Kapaligiran ng Pag-develop

**Mga Prayoridad**: Pag-optimize ng gastos, pangunahing functionality, madaling provisioning/de-provisioning

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

#### Mga Katangian
- **App Service**: F1 (Free) or B1 (Basic) para sa simpleng pagsubok
- **Databases**: Basic tier na may minimal na mga resources
- **Storage**: Standard na may local redundancy lamang
- **Compute**: Tinatanggap ang shared resources
- **Networking**: Mga pangunahing konfigurasyon

### Kapaligiran ng Staging/Pagsubok

**Mga Prayoridad**: Konfigurasyon na kahawig ng produksyon, balanse sa gastos, kakayahan sa pagsubok ng pagganap

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

#### Mga Katangian
- **Pagganap**: 70-80% ng kapasidad ng produksyon
- **Mga Tampok**: Karamihan sa mga tampok ng produksyon ay naka-enable
- **Redundancy**: May ilang geographic redundancy
- **Scaling**: Limitadong auto-scaling para sa pagsubok
- **Monitoring**: Buong monitoring stack

### Kapaligiran ng Produksyon

**Mga Prayoridad**: Pagganap, availability, seguridad, pagsunod sa regulasyon, scalability

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

#### Mga Katangian
- **High availability**: Mga kinakailangan ng SLA na 99.9%+
- **Pagganap**: Dedicated na mga resources, mataas na throughput
- **Seguridad**: Premium na mga tampok sa seguridad
- **Scaling**: Buong kakayahan ng auto-scaling
- **Monitoring**: Komprehensibong observability

---

## Mga Patnubay para sa Bawat Serbisyo

### Azure App Service

#### Matriks ng Desisyon ng SKU

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sapat para sa pagsubok |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Mas mahusay na pagganap, mas maraming tampok |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, mataas na pagganap |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### Mga Halimbawa ng Konfigurasyon

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

#### Balangkas para sa Pagpili ng SKU

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - Pag-develop/pagsusuri
   - **Standard**: S0-S12 (10-3000 DTU) - Pangkaraniwang paggamit
   - **Premium**: P1-P15 (125-4000 DTU) - Performance-critical

2. **vCore-based** (Inirerekomenda para sa produksyon)
   - **General Purpose**: Balanseng compute at storage
   - **Business Critical**: Mababang latency, mataas na IOPS
   - **Hyperscale**: Napakalaking scalable na storage (hanggang 100TB)

#### Mga Halimbawa ng Konfigurasyon

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

#### Mga Uri ng Kapaligiran

1. **Consumption-based**
   - Pay-per-use na pagpepresyo
   - Angkop para sa pag-develop at mga variable na workload
   - Shared infrastructure

2. **Dedicated (Workload Profiles)**
   - Nakatuong compute resources
   - Predictable na pagganap
   - Mas angkop para sa mga workload ng produksyon

#### Mga Halimbawa ng Konfigurasyon

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

#### Mga Modelo ng Throughput

1. **Manual Provisioned Throughput**
   - Predictable na pagganap
   - Mga diskwento para sa reserved capacity
   - Pinakamainam para sa mga steady workloads

2. **Autoscale Provisioned Throughput**
   - Awtomatikong nagsa-scale batay sa paggamit
   - Nagbabayad para sa ginagamit (na may minimum)
   - Mabuti para sa mga variable na workload

3. **Serverless**
   - Pay-per-request
   - Walang provisioned throughput
   - Ideal para sa pag-develop at paminsang workload

#### Mga Halimbawa ng SKU

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

#### Mga Uri ng Storage Account

1. **Standard_LRS** - Pag-develop, hindi kritikal na data
2. **Standard_GRS** - Produksyon, nangangailangan ng geo-redundancy
3. **Premium_LRS** - Mga application na nangangailangan ng mataas na pagganap
4. **Premium_ZRS** - Mataas na availability na may zone redundancy

#### Mga Antas ng Pagganap

- **Standard**: General purpose, cost-effective
- **Premium**: Mataas na pagganap, mababang latency na mga senaryo

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

## Mga Estratehiya sa Pag-optimize ng Gastos

### 1. Reserved Capacity

Mag-reserve ng resources para sa 1-3 taon para sa makabuluhang mga diskwento:

```bash
# Suriin ang mga pagpipilian sa reserbasyon
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

Magsimula sa mas maliit na mga SKU at mag-scale up batay sa aktwal na paggamit:

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

Magpatupad ng matalinong scaling upang i-optimize ang gastos:

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

I-scale down sa mga off-hours:

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

## Mga Isinasaalang-alang sa Pagganap

### Pangunahing Kinakailangan sa Pagganap

Tukuyin ang malinaw na mga kinakailangan sa pagganap bago ang pagpili ng SKU:

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

### Pagsusuri ng Load

Subukan ang iba't ibang SKU upang mapatunayan ang pagganap:

```bash
# Serbisyo ng Azure Load Testing
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Pagmamanman at Pag-optimize

Mag-set up ng komprehensibong pagmamanman:

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

## Mabilis na Sanggunian na Mga Talahanayan

### Mabilis na Sanggunian ng App Service SKU

| SKU | Antas | vCPU | RAM | Storage | Saklaw ng Presyo | Gamit |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Pag-develop |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Maliit na apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produksyon |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Mataas na pagganap |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Mabilis na Sanggunian ng SQL Database SKU

| SKU | Antas | DTU/vCore | Storage | Saklaw ng Presyo | Gamit |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Pag-develop |
| S2 | Standard | 50 DTU | 250GB | $$ | Maliit na produksyon |
| P2 | Premium | 250 DTU | 1TB | $$$ | Mataas na pagganap |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanseng gamit |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Kritikal sa misyon |

### Mabilis na Sanggunian ng Container Apps SKU

| Model | Pricing | CPU/Memory | Gamit |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Pag-develop, variable na load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Produksyon |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | Mataas na pagganap |

---

## Mga Tool sa Pagpapatunay

### SKU Availability Checker

```bash
#!/bin/bash
# Suriin ang pagkakaroon ng SKU sa target na rehiyon

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

# Paggamit
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# PowerShell script para sa pagtatantya ng gastos
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
        
        # Gamitin ang Azure Pricing API o calculator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Paggamit
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

## Buod ng Mga Pinakamahusay na Gawi

### Mga Dapat Gawin

1. **Magsimula ng maliit at mag-scale up** batay sa aktwal na paggamit
2. **Gumamit ng iba't ibang SKUs para sa iba't ibang kapaligiran**
3. **Subaybayan ang pagganap at mga gastos nang patuloy**
4. **Samantalahin ang reserved capacity para sa mga workload ng produksyon**
5. **Magpatupad ng auto-scaling kung angkop**
6. **Subukan ang pagganap gamit ang makatotohanang mga workload**
7. **Magplano para sa paglago ngunit iwasan ang over-provisioning**
8. **Gamitin ang mga free tier para sa pag-develop kapag posible**

### Mga Huwag Gawin

1. **Huwag gumamit ng production SKUs para sa pag-develop**
2. **Huwag balewalain ang availability ng SKU ayon sa rehiyon**
3. **Huwag kalimutan ang mga gastos sa data transfer**
4. **Huwag mag-over-provision nang walang katwiran**
5. **Huwag balewalain ang epekto ng mga dependency**
6. **Huwag itakda ang mga limitasyon ng auto-scaling nang masyadong mataas**
7. **Huwag kalimutan ang mga kinakailangan sa pagsunod sa regulasyon**
8. **Huwag gumawa ng mga desisyon batay sa presyo lamang**

---

**Tip**: Gamitin ang Azure Cost Management at Advisor para makakuha ng mga personalisadong rekomendasyon sa pag-optimize ng iyong mga pagpili ng SKU batay sa aktwal na mga pattern ng paggamit.

---

**Pag-navigate**
- **Nakaraang Leksyon**: [Pagpaplano ng Kapasidad](capacity-planning.md)
- **Susunod na Leksyon**: [Paunang Pagsusuri](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa kanyang likas na wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling ginawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->