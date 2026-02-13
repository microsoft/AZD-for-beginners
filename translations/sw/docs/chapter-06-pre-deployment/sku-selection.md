# Mwongozo wa Uchaguzi wa SKU - Kuchagua Ngazi Sahihi za Huduma za Azure

**Uelekezaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 6 - Uthibitishaji na Upangaji kabla ya Utoaji
- **⬅️ Iliyotangulia**: [Upangaji wa Uwezo](capacity-planning.md)
- **➡️ Ifuatayo**: [Ukaguzi wa Kabla ya Kutekeleza](preflight-checks.md)
- **🚀 Sura Ifuatayo**: [Sura 7: Kutatua Matatizo](../chapter-07-troubleshooting/common-issues.md)

## Utangulizi

Mwongozo huu kamili unakusaidia kuchagua SKU (Stock Keeping Units) za huduma za Azure zinazofaa kwa mazingira tofauti, mzigo wa kazi, na mahitaji. Jifunze kuchambua mahitaji ya utendaji, vigezo vya gharama, na mahitaji ya upanuaji ili kuchagua ngazi zinazofaa za huduma kwa utekelezaji wako wa Azure Developer CLI.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utakuwa na uwezo wa:
- Kuelewa dhana za SKU za Azure, mifumo ya bei, na tofauti za vipengele
- Kumudu mikakati ya uchaguzi wa SKU kwa mazingira maalum kama maendeleo, hatua za kuandaa, na uzalishaji
- Kuchambua mahitaji ya mzigo wa kazi na kuyaleta kwa ngazi sahihi za huduma
- Kutoa mikakati ya uboreshaji wa gharama kupitia uchaguzi wa busara wa SKU
- Kutumia mbinu za upimaji wa utendaji na uthibitisho kwa chaguzi za SKU
- Kupanga mapendekezo ya kiotomatiki ya SKU na ufuatiliaji

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kuchagua SKU za huduma za Azure zinazofaa kulingana na mahitaji na vizingiti vya mzigo wa kazi
- Kubuni usanifu wa mazingira mengi wenye gharama nafuu kwa uchaguzi sahihi wa ngazi
- Kutekeleza vipimo vya utendaji na uthibitisho kwa chaguzi za SKU
- Kuunda zana za kiotomatiki kwa ajili ya mapendekezo ya SKU na uboreshaji wa gharama
- Kupanga mabadiliko ya SKU na mikakati ya upanuaji kwa mahitaji yanayobadilika
- Kutumia kanuni za Azure Well-Architected Framework katika uchaguzi wa ngazi za huduma

## Yaliyomo

- [Kuelewa SKU](../../../../docs/chapter-06-pre-deployment)
- [Uchaguzi Unaotegemea Mazingira](../../../../docs/chapter-06-pre-deployment)
- [Mwongozo Maalum kwa Huduma](../../../../docs/chapter-06-pre-deployment)
- [Mikakati ya Uboreshaji wa Gharama](../../../../docs/chapter-06-pre-deployment)
- [Mambo ya Utendaji](../../../../docs/chapter-06-pre-deployment)
- [Meza za Marejeo ya Haraka](../../../../docs/chapter-06-pre-deployment)
- [Zana za Uthibitisho](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### What are SKUs?

SKU (Stock Keeping Units) zinaonyesha ngazi tofauti za huduma na viwango vya utendaji kwa rasilimali za Azure. Kila SKU inatoa tofauti za:

- **Sifa za utendaji** (CPU, kumbukumbu, throughput)
- **Upatikanaji wa vipengele** (chaguzi za upanuaji, viwango vya SLA)
- **Mifumo ya bei** (kulipia kwa matumizi, uwezo uliohifadhiwa)
- **Upatikanaji wa kikanda** (si SKU zote zinapatikana katika kanda zote)

### Key Factors in SKU Selection

1. **Mahitaji ya Mzigo wa Kazi**
   - Mipangilio ya trafiki/mzigo inayotarajiwa
   - Mahitaji ya utendaji (CPU, kumbukumbu, I/O)
   - Mahitaji ya kuhifadhi na mifumo ya upatikanaji

2. **Aina ya Mazingira**
   - Maendeleo/majaribio dhidi ya uzalishaji
   - Mahitaji ya upatikanaji
   - Mahitaji ya usalama na uzingatiaji

3. **Vizingiti vya Bajeti**
   - Gharama za awali dhidi ya gharama za uendeshaji
   - Punguzo la uwezo uliohifadhiwa
   - Athari za gharama za auto-scaling

4. **Makadirio ya Ukuaji**
   - Mahitaji ya upanuaji
   - Mahitaji ya vipengele vya baadaye
   - Ugumu wa uhamishaji

---

## Environment-Based Selection

### Development Environment

**Vipaumbele**: Uboreshaji wa gharama, utendakazi wa msingi, utoaji/kuondoa rahisi wa rasilimali

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
- **App Service**: F1 (Free) au B1 (Basic) kwa majaribio rahisi
- **Databases**: Ngazi ya Basic yenye rasilimali za kimsingi
- **Storage**: Standard yenye redundancy ya ndani tu
- **Compute**: Rasilimali zilizogawanywa zinakubalika
- **Networking**: Mipangilio ya msingi

### Staging/Testing Environment

**Vipaumbele**: Mipangilio inayofanana na uzalishaji, uwiano wa gharama, uwezo wa upimaji wa utendaji

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
- **Utendaji**: 70-80% ya uwezo wa uzalishaji
- **Vipengele**: Vipengele vingi vya uzalishaji vimewezeshwa
- **Ukurugenzi**: Baadhi ya redundancy ya kijiografia
- **Upanuaji**: Auto-scaling iliyopunguzwa kwa ajili ya majaribio
- **Ufuatiliaji**: Mfululizo kamili wa ufuatiliaji

### Production Environment

**Vipaumbele**: Utendaji, upatikanaji, usalama, uzingatiaji, upanuaji

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
- **Upatikanaji wa juu**: Mahitaji ya SLA ya 99.9%+
- **Utendaji**: Rasilimali za kujitolea, throughput ya juu
- **Usalama**: Vipengele vya usalama vya premium
- **Upanuaji**: Uwezo kamili wa auto-scaling
- **Ufuatiliaji**: Ubonyezi wa uchunguzi kamili

---

## Service-Specific Guidelines

### Azure App Service

#### SKU Decision Matrix

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

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
   - **Basic**: 5 DTU - Maendeleo/majaribio
   - **Standard**: S0-S12 (10-3000 DTU) - Kusudi la jumla
   - **Premium**: P1-P15 (125-4000 DTU) - Mifumo inayohitaji utendaji mkubwa

2. **vCore-based** (Inapendekezwa kwa uzalishaji)
   - **General Purpose**: Mchanganyiko sawa wa compute na kuhifadhi
   - **Business Critical**: Latency ndogo, IOPS kubwa
   - **Hyperscale**: Kuhifadhi inayoweza kupanuka kwa kiwango kikubwa (hadi 100TB)

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
   - Malipo kwa matumizi
   - Inafaa kwa maendeleo na mizigo ya kazi inayobadilika
   - Miundombinu iliyogawanywa

2. **Dedicated (Workload Profiles)**
   - Rasilimali za compute zilizojitolea
   - Utendaji unaoweza kutegemewa
   - Bora kwa mzigo wa uzalishaji

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
   - Utendaji unaoweza kutabirika
   - Punguzo la uwezo uliohifadhiwa
   - Bora kwa mizigo thabiti

2. **Autoscale Provisioned Throughput**
   - Upanuaji wa moja kwa moja kulingana na matumizi
   - Lipa kwa kile unachotumia (kwa chini)
   - Nzuri kwa mizigo inayobadilika

3. **Serverless**
   - Lipa kwa ombi
   - Hakuna throughput iliyotengwa
   - Inafaa kwa maendeleo na mizigo ya kazi isiyokuwa ya kudumu

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

1. **Standard_LRS** - Maendeleo, data isiyo muhimu sana
2. **Standard_GRS** - Uzalishaji, inahitaji geo-redundancy
3. **Premium_LRS** - Programu za utendaji wa juu
4. **Premium_ZRS** - Upatikanaji wa juu kwa redundancy ya zona

#### Performance Tiers

- **Standard**: Madhumuni ya jumla, gharama nafuu
- **Premium**: Utendaji wa juu, matukio ya latency ndogo

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

## Mikakati ya Uboreshaji wa Gharama

### 1. Reserved Capacity

Hifadhi rasilimali kwa 1-3 miaka kwa punguzo kubwa:

```bash
# Angalia chaguzi za uhifadhi
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

Anza na SKU ndogo na upandishe kulingana na matumizi halisi:

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

Tekeleza upanuaji wa busara ili kuboresha gharama:

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

Punguza wakati wa saa zisizo za kazi:

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

## Mambo ya Utendaji

### Baseline Performance Requirements

Tambua mahitaji wazi ya utendaji kabla ya uchaguzi wa SKU:

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

Jaribu SKU tofauti ili kuthibitisha utendaji:

```bash
# Huduma ya Azure ya kupima mzigo
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring and Optimization

Weka ufuatiliaji kamili:

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

## Meza za Marejeo ya Haraka

### App Service SKU Quick Reference

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU Quick Reference

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Container Apps SKU Quick Reference

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## Zana za Uthibitisho

### SKU Availability Checker

```bash
#!/bin/bash
# Angalia upatikanaji wa SKU katika eneo lengwa

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

# Matumizi
check_sku_availability "eastus" "app-service" "P1V3"
```

### Cost Estimation Script

```powershell
# Skripti ya PowerShell kwa makadirio ya gharama
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
        
        # Tumia Azure Pricing API au kalkuleta
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Matumizi
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

## Muhtasari wa Mazoea Bora

### Yafaa Kufanywa

1. **Anza ndogo na upandishe** kulingana na matumizi halisi
2. **Tumia SKU tofauti kwa mazingira tofauti**
3. **Fuatilia utendaji na gharama kwa kuendelea**
4. **Tumia uwezo uliohifadhiwa kwa mzigo wa uzalishaji**
5. **Tekeleza auto-scaling inapofaa**
6. **Jaribu utendaji kwa mizigo ya kazi halisi**
7. **Panga ukuaji lakini epuka ku-provision kupita kiasi**
8. **Tumia ngazi za bure kwa maendeleo inapowezekana**

### Usifanye

1. **Usitumie SKU za uzalishaji kwa maendeleo**
2. **Usizame upatikanaji wa kikanda wa SKU**
3. **Usisahau gharama za uhamisho wa data**
4. **Usipatie rasilimali nyingi bila hoja**
5. **Usiache athari za utegemezi bila kuangalia**
6. **Usiweka mipaka ya auto-scaling juu mno**
7. **Usisahau mahitaji ya uzingatiaji**
8. **Usichague kwa msingi wa bei peke yake**

---

**Ushauri wa Kitaalamu**: Tumia Azure Cost Management na Advisor kupata mapendekezo binafsi ya kuboresha uchaguzi wako wa SKU kulingana na mifumo ya matumizi halisi.

---

**Uelekezaji**
- **Somo la Awali**: [Upangaji wa Uwezo](capacity-planning.md)
- **Somo Lifuatao**: [Ukaguzi wa Kabla ya Kutekeleza](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutokuwajibika:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali kumbuka kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Nyaraka ya asili kwa lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya kitaalamu ya binadamu. Hatuwajibiki kwa kutokuelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->