<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T22:08:23+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "tl"
}
-->
# Gabay sa Pagpili ng SKU - Pagpili ng Tamang Azure Service Tiers

## Panimula

Ang komprehensibong gabay na ito ay tumutulong sa iyo na pumili ng pinakamainam na Azure service SKUs (Stock Keeping Units) para sa iba't ibang kapaligiran, workload, at pangangailangan. Matutunan kung paano suriin ang mga pangangailangan sa performance, mga konsiderasyon sa gastos, at mga kinakailangan sa scalability upang piliin ang pinakaangkop na service tiers para sa iyong Azure Developer CLI deployments.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito, ikaw ay:
- Maiintindihan ang mga konsepto ng Azure SKU, mga modelo ng pagpepresyo, at mga pagkakaiba sa feature
- Magiging bihasa sa mga estratehiya sa pagpili ng SKU na naaayon sa kapaligiran para sa development, staging, at production
- Masusuri ang mga pangangailangan ng workload at maitugma ang mga ito sa tamang service tiers
- Makakagamit ng mga estratehiya sa pag-optimize ng gastos sa pamamagitan ng matalinong pagpili ng SKU
- Makakapagpatupad ng mga teknik sa performance testing at validation para sa mga napiling SKU
- Makakapag-configure ng automated SKU recommendations at monitoring

## Mga Resulta ng Pagkatuto

Sa pagtatapos, magagawa mo ang sumusunod:
- Pumili ng tamang Azure service SKUs batay sa mga pangangailangan at limitasyon ng workload
- Magdisenyo ng cost-effective na multi-environment architectures gamit ang tamang tier selection
- Magpatupad ng performance benchmarking at validation para sa mga napiling SKU
- Gumawa ng automated tools para sa SKU recommendation at cost optimization
- Magplano ng SKU migrations at scaling strategies para sa mga nagbabagong pangangailangan
- Mag-apply ng mga prinsipyo ng Azure Well-Architected Framework sa pagpili ng service tiers

## Talaan ng Nilalaman

- [Pag-unawa sa SKUs](../../../../docs/pre-deployment)
- [Pagpili Batay sa Kapaligiran](../../../../docs/pre-deployment)
- [Mga Gabay na Tukoy sa Serbisyo](../../../../docs/pre-deployment)
- [Mga Estratehiya sa Pag-optimize ng Gastos](../../../../docs/pre-deployment)
- [Mga Pagsasaalang-alang sa Performance](../../../../docs/pre-deployment)
- [Mga Mabilisang Reference na Talaan](../../../../docs/pre-deployment)
- [Mga Validation Tools](../../../../docs/pre-deployment)

---

## Pag-unawa sa SKUs

### Ano ang SKUs?

Ang SKUs (Stock Keeping Units) ay kumakatawan sa iba't ibang service tiers at performance levels para sa mga Azure resources. Ang bawat SKU ay nag-aalok ng iba't ibang:

- **Mga katangian ng performance** (CPU, memory, throughput)
- **Availability ng feature** (mga opsyon sa scaling, mga antas ng SLA)
- **Mga modelo ng pagpepresyo** (consumption-based, reserved capacity)
- **Availability sa rehiyon** (hindi lahat ng SKUs ay available sa lahat ng rehiyon)

### Mga Pangunahing Salik sa Pagpili ng SKU

1. **Mga Pangangailangan ng Workload**
   - Inaasahang traffic/load patterns
   - Mga kinakailangan sa performance (CPU, memory, I/O)
   - Mga pangangailangan sa storage at access patterns

2. **Uri ng Kapaligiran**
   - Development/testing kumpara sa production
   - Mga kinakailangan sa availability
   - Mga pangangailangan sa seguridad at pagsunod

3. **Mga Limitasyon sa Badyet**
   - Paunang gastos kumpara sa operational na gastos
   - Mga diskwento sa reserved capacity
   - Mga implikasyon ng auto-scaling sa gastos

4. **Mga Proyeksiyon ng Paglago**
   - Mga kinakailangan sa scalability
   - Mga pangangailangan sa hinaharap na feature
   - Kumplikasyon sa migration

---

## Pagpili Batay sa Kapaligiran

### Kapaligiran ng Development

**Prayoridad**: Pag-optimize ng gastos, pangunahing functionality, madaling provisioning/de-provisioning

#### Mga Inirerekomendang SKUs
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
- **App Service**: F1 (Free) o B1 (Basic) para sa simpleng testing
- **Databases**: Basic tier na may minimal na resources
- **Storage**: Standard na may lokal na redundancy lamang
- **Compute**: Katanggap-tanggap ang shared resources
- **Networking**: Mga pangunahing configuration

### Kapaligiran ng Staging/Testing

**Prayoridad**: Production-like configuration, balanse sa gastos, kakayahan sa performance testing

#### Mga Inirerekomendang SKUs
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
- **Performance**: 70-80% ng production capacity
- **Mga Feature**: Karamihan sa production features ay naka-enable
- **Redundancy**: May geographic redundancy
- **Scaling**: Limitadong auto-scaling para sa testing
- **Monitoring**: Kumpletong monitoring stack

### Kapaligiran ng Production

**Prayoridad**: Performance, availability, seguridad, pagsunod, scalability

#### Mga Inirerekomendang SKUs
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
- **High availability**: 99.9%+ SLA requirements
- **Performance**: Dedicated resources, mataas na throughput
- **Seguridad**: Mga premium na security features
- **Scaling**: Kumpletong auto-scaling capabilities
- **Monitoring**: Komprehensibong observability

---

## Mga Gabay na Tukoy sa Serbisyo

### Azure App Service

#### Matrix ng Desisyon sa SKU

| Gamit | Inirerekomendang SKU | Rason |
|-------|----------------------|-------|
| Development/Testing | F1 (Free) o B1 (Basic) | Cost-effective, sapat para sa testing |
| Maliit na production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Katamtamang production apps | P1V3 (Premium V3) | Mas mahusay na performance, mas maraming features |
| Mataas na traffic apps | P2V3 o P3V3 | Dedicated resources, mataas na performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### Mga Halimbawa ng Configuration

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

#### Framework sa Pagpili ng SKU

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - Development/testing
   - **Standard**: S0-S12 (10-3000 DTU) - General purpose
   - **Premium**: P1-P15 (125-4000 DTU) - Performance-critical

2. **vCore-based** (Inirerekomenda para sa production)
   - **General Purpose**: Balanseng compute at storage
   - **Business Critical**: Mababa ang latency, mataas ang IOPS
   - **Hyperscale**: Lubos na scalable na storage (hanggang 100TB)

#### Mga Halimbawa ng Configuration

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
   - Pay-per-use pricing
   - Angkop para sa development at variable workloads
   - Shared infrastructure

2. **Dedicated (Workload Profiles)**
   - Dedicated compute resources
   - Predictable performance
   - Mas angkop para sa production workloads

#### Mga Halimbawa ng Configuration

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
   - Predictable performance
   - Mga diskwento sa reserved capacity
   - Pinakamainam para sa steady workloads

2. **Autoscale Provisioned Throughput**
   - Automatic scaling batay sa paggamit
   - Magbabayad lamang sa ginamit (may minimum)
   - Maganda para sa variable workloads

3. **Serverless**
   - Pay-per-request
   - Walang provisioned throughput
   - Ideal para sa development at intermittent workloads

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

1. **Standard_LRS** - Development, non-critical data
2. **Standard_GRS** - Production, geo-redundancy needed
3. **Premium_LRS** - High-performance applications
4. **Premium_ZRS** - High availability na may zone redundancy

#### Mga Tiers ng Performance

- **Standard**: General purpose, cost-effective
- **Premium**: High-performance, low-latency scenarios

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

Mag-reserve ng resources para sa 1-3 taon para sa malaking diskwento:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

Magsimula sa mas maliit na SKUs at mag-scale up batay sa aktwal na paggamit:

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

Magpatupad ng intelligent scaling upang ma-optimize ang gastos:

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

Mag-scale down sa mga oras na hindi abala:

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

## Mga Pagsasaalang-alang sa Performance

### Mga Pangunahing Kinakailangan sa Performance

Mag-defina ng malinaw na mga kinakailangan sa performance bago pumili ng SKU:

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

Subukan ang iba't ibang SKUs upang ma-validate ang performance:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring at Optimization

Mag-set up ng komprehensibong monitoring:

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

## Mga Mabilisang Reference na Talaan

### App Service SKU Quick Reference

| SKU | Tier | vCPU | RAM | Storage | Saklaw ng Presyo | Gamit |
|-----|------|------|-----|---------|------------------|-------|
| F1 | Free | Shared | 1GB | 1GB | Libre | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Maliit na apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Mataas na performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU Quick Reference

| SKU | Tier | DTU/vCore | Storage | Saklaw ng Presyo | Gamit |
|-----|------|-----------|---------|------------------|-------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Maliit na production |
| P2 | Premium | 250 DTU | 1TB | $$$ | Mataas na performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanseng |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Container Apps SKU Quick Reference

| Modelo | Pagpepresyo | CPU/Memory | Gamit |
|--------|-------------|------------|-------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | Mataas na performance |

---

## Mga Validation Tools

### SKU Availability Checker

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

### Cost Estimation Script

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

## Buod ng Mga Best Practices

### Mga Dapat Gawin

1. **Magsimula nang maliit at mag-scale up** batay sa aktwal na paggamit
2. **Gumamit ng iba't ibang SKUs para sa iba't ibang kapaligiran**
3. **Patuloy na i-monitor ang performance at gastos**
4. **Gamitin ang reserved capacity para sa production workloads**
5. **Magpatupad ng auto-scaling kung naaangkop**
6. **Subukan ang performance gamit ang realistic workloads**
7. **Magplano para sa paglago ngunit iwasan ang over-provisioning**
8. **Gamitin ang mga libreng tiers para sa development kung maaari**

### Mga Dapat Iwasan

1. **Huwag gumamit ng production SKUs para sa development**
2. **Huwag balewalain ang availability ng SKU sa rehiyon**
3. **Huwag kalimutan ang mga gastos sa data transfer**
4. **Huwag mag-over-provision nang walang sapat na dahilan**
5. **Huwag balewalain ang epekto ng dependencies**
6. **Huwag mag-set ng auto-scaling limits na masyadong mataas**
7. **Huwag kalimutan ang mga kinakailangan sa pagsunod**
8. **Huwag gumawa ng desisyon batay lamang sa presyo**

---

**Pro Tip**: Gamitin ang Azure Cost Management at Advisor upang makakuha ng personalized na rekomendasyon para sa pag-optimize ng iyong SKU selections batay sa aktwal na usage patterns.

---

**Navigation**
- **Nakaraang Aralin**: [Capacity Planning](capacity-planning.md)
- **Susunod na Aralin**: [Preflight Checks](preflight-checks.md)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na pinagmulan. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.