# Gabay sa Pagpili ng SKU - Pagpili ng Tamang Azure Service Tiers

**Pag-navigate ng Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 6 - Pre-Deployment Validation & Planning
- **⬅️ Nakaraan**: [Capacity Planning](capacity-planning.md)
- **➡️ Susunod**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Susunod na Kabanata**: [Kabanata 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## Panimula

Ang komprehensibong gabay na ito ay tumutulong sa iyong pumili ng pinakamainam na Azure service SKUs (Stock Keeping Units) para sa iba't ibang kapaligiran, mga workload, at pangangailangan. Matutunan kung paano suriin ang mga pangangailangan sa pagganap, mga konsiderasyon sa gastos, at mga kinakailangan sa scalability upang piliin ang pinakaangkop na service tiers para sa iyong mga deployment gamit ang Azure Developer CLI.

## Mga Layunin ng Pagkatuto

Sa pagtatapos ng gabay na ito, magagawa mong:
- Maunawaan ang mga konsepto ng Azure SKU, mga modelo ng pagpepresyo, at pagkakaiba-iba ng mga tampok
- Maging bihasa sa mga estratehiya ng pagpili ng SKU na nakabatay sa kapaligiran para sa development, staging, at production
- Suriin ang mga pangangailangan ng workload at iakma ang mga ito sa angkop na service tiers
- Magpatupad ng mga estratehiya para sa pag-optimize ng gastos sa pamamagitan ng matalinong pagpili ng SKU
- Ilapat ang mga teknik sa pagsubok ng pagganap at pag-validate para sa mga pagpipilian ng SKU
- I-configure ang mga automated na rekomendasyon ng SKU at monitoring

## Mga Resulta ng Pagkatuto

Pagkatapos makumpleto, magagawa mong:
- Pumili ng angkop na Azure service SKUs batay sa mga pangangailangan at paghihigpit ng workload
- Magdisenyo ng cost-effective na multi-environment architecture gamit ang tamang pagpili ng tier
- Magpatupad ng benchmarking at pag-validate ng pagganap para sa mga pagpipilian ng SKU
- Lumikha ng mga automated na tool para sa rekomendasyon ng SKU at pag-optimize ng gastos
- Magplano ng mga estratehiya sa migration at pag-scale ng SKU para sa nagbabagong mga pangangailangan
- Ilapat ang mga prinsipyo ng Azure Well-Architected Framework sa pagpili ng service tier

## Talaan ng Nilalaman

- [Pag-unawa sa SKUs](#understanding-skus)
- [Pagpili Batay sa Kapaligiran](#environment-based-selection)
- [Mga Gabay na Espesipiko sa Serbisyo](#service-specific-guidelines)
- [Mga Estratehiya sa Pag-optimize ng Gastos](#cost-optimization-strategies)
- [Mga Konsiderasyon sa Pagganap](#performance-considerations)
- [Mga Mabilisang Talaan ng Sanggunian](#quick-reference-tables)
- [Mga Kasangkapan sa Pag-validate](#validation-tools)

---

## Pag-unawa sa SKUs

> **Halimbawa ng saklaw:** Ang mga YAML SKU map at mga performance configuration sa ibaba ay mga tala sa disenyo, hindi isang `azure.yaml` schema o configuration para sa load-tool. Ang mga Bicep block ay mga alternatibo/piraso: ideklara ang kanilang mga parameter at mga parent na resources, gumamit ng natatanging simbolikong mga pangalan kapag pinagsama-sama, at i-wire ang mga module sa isang gumaganang proyekto. Ang mga presyo, limitasyon, at availability ng rehiyon/SKU ay kailangang suriin para sa iyong subscription bago mag-deploy.

### Ano ang mga SKUs?

Ang SKUs (Stock Keeping Units) ay kumakatawan sa iba't ibang service tiers at mga antas ng pagganap para sa mga Azure resources. Bawat SKU ay nag-aalok ng iba't ibang:

- **Mga katangian ng pagganap** (CPU, memorya, throughput)
- **Availability ng mga tampok** (mga pagpipilian sa scaling, antas ng SLA)
- **Mga modelo ng pagpepresyo** (batay sa konsumo, reserved capacity)
- **Availability sa rehiyon** (hindi lahat ng SKU ay magagamit sa lahat ng rehiyon)

### Mga Mahalagang Salik sa Pagpili ng SKU

1. **Mga Pangangailangan ng Workload**
   - Inaasahang trapiko/patterns ng load
   - Mga pangangailangan sa pagganap (CPU, memorya, I/O)
   - Mga pangangailangan sa imbakan at mga pattern sa pag-access

2. **Uri ng Kapaligiran**
   - Development/testing kumpara sa production
   - Mga pangangailangan sa availability
   - Mga pangangailangan sa seguridad at pagsunod

3. **Mga Paghihigpit sa Badyet**
   - Paunang gastos kumpara sa mga operational na gastos
   - Mga diskwento sa reserved capacity
   - Mga epekto ng gastos sa auto-scaling

4. **Mga Proyeksyon sa Paglago**
   - Mga kinakailangan sa scalability
   - Mga pangangailangan sa mga tampok sa hinaharap
   - Komplikasyon sa migration

---

## Pagpili Batay sa Kapaligiran

### Development Environment

**Mga Prayoridad**: Pag-optimize ng gastos, pangunahing functionality, madaling provisioning/de-provisioning

#### Inirerekomendang SKUs
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

#### Mga Katangian
- **App Service**: F1 (Libre) o B1 (Basic) para sa simpleng testing
- **Databases**: Basic tier na may minimal na mga resources
- **Storage**: Standard na may lokal na redundancy lamang
- **Compute**: Katanggap-tanggap ang mga shared resources
- **Networking**: Mga basic na configuration

### Staging/Testing Environment

**Mga Prayoridad**: Production-like na configuration, balanse sa gastos, kakayahan sa performance testing

#### Inirerekomendang SKUs
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
- **Pagganap**: 70-80% ng kapasidad ng production
- **Mga Tampok**: Halos lahat ng tampok ng production ay naka-enable
- **Redundancy**: May ilang geographic redundancy
- **Scaling**: Limitadong auto-scaling para sa testing
- **Monitoring**: Kumpletong monitoring stack

### Production Environment

**Mga Prayoridad**: Pagganap, availability, seguridad, pagsunod, scalability

#### Inirerekomendang SKUs
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

#### Mga Katangian
- **Mataas na availability**: Mga pangangailangan ng 99.9%+ SLA
- **Pagganap**: Nakalaang mga resources, mataas na throughput
- **Seguridad**: Mga premium na tampok sa seguridad
- **Scaling**: Kumpletong kakayahan sa auto-scaling
- **Monitoring**: Komprehensibong obserbabilidad

---

## Mga Gabay na Espesipiko sa Serbisyo

### Azure App Service

#### SKU Decision Matrix

| Use Case | Inirerekomendang SKU | Rasyonal |
|----------|----------------|-----------|
| Development/Testing | F1 (Libre) o B1 (Basic) | Makatipid sa gastos, sapat para sa testing |
| Maliit na production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Katamtamang production apps | P1V3 (Premium V3) | Mas mahusay na pagganap, mas maraming tampok |
| Mga app na may mataas na trapiko | P2V3 o P3V3 | Nakalaang mga resources, mataas na pagganap |
| Mga app na mission-critical | I1V2 (Isolated V2) | Network isolation, nakalaang hardware |

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
   - **Standard**: S0-S12 (10-3000 DTU) - Pangkaraniwang gamit
   - **Premium**: P1-P15 (125-4000 DTU) - Para sa performance-critical

2. **vCore-based** (Inirerekomenda para sa production)
   - **General Purpose**: Balanced na compute at storage
   - **Business Critical**: Mababang latency, mataas na IOPS
   - **Hyperscale**: Lubos na scalable na storage; suriin ang kasalukuyang mga limitasyon sa laki at suporta sa rehiyon

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

#### Uri ng Kapaligiran

1. **Batay sa Konsumo**
   - Pagpepresyong pay-per-use
   - Angkop para sa development at mga variable na workload
   - Shared infrastructure

2. **Dedikado (Mga Profile ng Workload)**
   - Nakalaang compute resources
   - Predictable na pagganap
   - Mas maganda para sa production workloads

#### Mga Halimbawa ng Configuration

**Development (Konsumo)**
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

**Production (Dedikado)**
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

Kinakailangang mayroon ding supported-region infrastructure at angkop na VNet/subnet configuration para sa zone redundancy, na hindi kasama dito. Ang halimbawa na ito ay naglaan ng tatlong dedikadong nodes; i-configure ang hindi bababa sa dalawang app replicas para sa cross-zone distribution at sukatin pareho ang replicas at nodes para sa failure ng zone. Tingnan ang [Mga gabay sa pagiging maaasahan ng Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Upang ilagay ang isang app sa profile na ito, itakda ang kanyang `workloadProfileName: 'production-profile'`; ang paglikha lamang ng profile ay hindi lilipat ng mga app dito.

### Azure Cosmos DB

#### Mga Modelo ng Throughput

1. **Manual Provisioned Throughput**
   - Predictable na pagganap
   - Mga diskwento sa reserved capacity
   - Pinakamabuti para sa steady workloads

2. **Autoscale Provisioned Throughput**
   - Awtomatikong scaling batay sa paggamit
   - Bayaran ang ginagamit (na may minimum)
   - Magandang para sa mga variable na workload

3. **Serverless**
   - Bayad kada request
   - Walang provisioned throughput
   - Ideal para sa development at mga panandaliang workload

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

1. **Standard_LRS** - Development, hindi kritikal na data
2. **Standard_GRS** - Production, kailangan ng geo-redundancy
3. **Premium_LRS** - Mga high-performance na aplikasyon
4. **Premium_ZRS** - Mataas na availability na may zone redundancy

#### Mga Tier ng Pagganap

- **Standard**: Pangkaraniwang gamit, cost-effective
- **Premium**: Mataas na pagganap, low-latency scenarios

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

Magpareserba ng mga resources para sa 1-3 taon para sa malalaking diskwento:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Ang mga alok sa reservation at mga angkop na uri ng resource ay nag-iiba; suriin ang katalogo at mga termino ng pagbili sa halip na isipin na bawat serbisyo/SKU ay sumusuporta sa reservation.

### 2. Tamang Sukat (Right-Sizing)

Magsimula sa mas maliliit na SKU at i-scale pataas base sa aktwal na paggamit:

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

Magpatupad ng matalinong scaling upang mai-optimize ang mga gastos:

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

### 4. Scheduled Scaling

Mag-scale down sa mga oras na wala gaanong gamit:

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

## Mga Konsiderasyon sa Pagganap

### Mga Baseline na Kinakailangan sa Pagganap

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

### Load Testing

Subukan ang iba't ibang mga SKU upang ma-validate ang pagganap:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
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

## Mga Mabilisang Talaan ng Sanggunian

### App Service SKU Mabilisang Sanggunian

| SKU | Tier | vCPU | RAM | Storage | Saklaw ng Presyo | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Libre | Shared | 1GB | 1GB | Libre | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Maliit na apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Mataas na pagganap |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU Mabilisang Sanggunian

| SKU | Tier | DTU/vCore | Storage | Saklaw ng Presyo | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Maliit na production |
| P2 | Premium | 250 DTU | 1TB | $$$ | Mataas na pagganap |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanseng gamit |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission-critical |

### Container Apps SKU Mabilisang Sanggunian

| Modelo | Pagpepresyo | CPU/Memorya | Use Case |
|-------|---------|------------|----------|
| Konsumo | Pay-per-use | Ang mga suportadong kumbinasyon ng CPU/memorya ay nakadepende sa kapaligiran/profile | Development o production, variable load |
| Dedikado D4 | Dedicated node billing | 4 vCPU, 16GiB bawat node | Sustained load/isolation needs |
| Dedikado D8 | Dedicated node billing | 8 vCPU, 32GiB bawat node | Mas mataas na sustained load |

---

## Mga Kasangkapan sa Pag-validate

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

### Script sa Pagtataya ng Gastos

**Pseudocode lamang:** Ang `Get-ResourceCost` sa ibaba ay isang project-specific na function na kailangang mong ipatupad gamit ang kasalukuyang regional/contract pricing at mga palagay sa paggamit. Hindi ito isang PowerShell o Azure cmdlet.

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

### Pag-validate ng Pagganap

Ang sumusunod na YAML ay isang balangkas ng mga pangangailangan, **hindi** isang input schema para sa Azure Load Testing, JMeter, Locust, o k6. Isalin ito sa totoong configuration ng iyong napiling kasangkapan bago gamitin ang load-test command sa itaas.

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

1. **Magsimula sa maliit at mag-scale pataas** base sa aktwal na paggamit
2. **Gumamit ng iba't ibang SKU para sa iba't ibang kapaligiran**
3. **Patuloy na i-monitor ang pagganap at mga gastos**
4. **Samantalahin ang reserved capacity para sa mga production workload**
5. **Magpatupad ng auto-scaling kung saan naaangkop**
6. **Subukin ang pagganap gamit ang makatotohanang mga workload**
7. **Magplano para sa paglago ngunit iwasan ang sobra-sobrang provisioning**
8. **Gamitin ang mga libreng tier para sa development kung maaari**

### Mga Hindi Dapat Gawin

1. **Huwag gumamit ng production SKUs para sa development**
2. **Huwag balewalain ang availability ng SKU sa rehiyon**
3. **Huwag kalimutan ang mga gastos sa data transfer**
4. **Huwag mag-over-provision nang walang sapat na dahilan**
5. **Huwag ipagsawalang-bahala ang epekto ng mga dependencies**
6. **Huwag itakda nang sobrang taas ang mga limitasyon sa auto-scaling**
7. **Huwag kalimutan ang mga pangangailangan sa pagsunod**
8. **Huwag gumawa ng mga desisyon base lamang sa presyo**

---

**Pro Tip**: Gamitin ang Azure Cost Management at Advisor upang makakuha ng mga personalisadong rekomendasyon para sa pag-optimize ng iyong mga pagpili ng SKU base sa aktwal na mga pattern ng paggamit.

---

**Pag-navigate**
- **Nakaraang Aralin**: [Capacity Planning](capacity-planning.md)
- **Susunod na Aralin**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->