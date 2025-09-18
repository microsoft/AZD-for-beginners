<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-18T09:01:10+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "sw"
}
-->
# Mwongozo wa Kuchagua SKU - Kuchagua Viwango Sahihi vya Huduma za Azure

**Ukurasa wa Sura:**
- **📚 Mwanzo wa Kozi**: [AZD Kwa Anayeanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 6 - Uthibitishaji na Mipango Kabla ya Utekelezaji
- **⬅️ Iliyopita**: [Mipango ya Uwezo](capacity-planning.md)
- **➡️ Inayofuata**: [Ukaguzi wa Awali](preflight-checks.md)
- **🚀 Sura Inayofuata**: [Sura ya 7: Utatuzi wa Shida](../troubleshooting/common-issues.md)

## Utangulizi

Mwongozo huu wa kina utakusaidia kuchagua SKU (Stock Keeping Units) bora za huduma za Azure kwa mazingira tofauti, mzigo wa kazi, na mahitaji. Jifunze kuchambua mahitaji ya utendaji, gharama, na mahitaji ya kupanuka ili kuchagua viwango vya huduma vinavyofaa zaidi kwa utekelezaji wa Azure Developer CLI.

## Malengo ya Kujifunza

Kwa kukamilisha mwongozo huu, utaweza:
- Kuelewa dhana za SKU za Azure, mifano ya bei, na tofauti za vipengele
- Kumudu mikakati ya kuchagua SKU kulingana na mazingira ya maendeleo, majaribio, na uzalishaji
- Kuchambua mahitaji ya mzigo wa kazi na kuyalinganisha na viwango vya huduma vinavyofaa
- Kutekeleza mikakati ya kupunguza gharama kupitia uchaguzi wa SKU wa busara
- Kutumia mbinu za kupima utendaji na kuthibitisha chaguo za SKU
- Kusimamia mapendekezo ya SKU na ufuatiliaji wa kiotomatiki

## Matokeo ya Kujifunza

Baada ya kukamilisha, utaweza:
- Kuchagua SKU za huduma za Azure zinazofaa kulingana na mahitaji na vikwazo vya mzigo wa kazi
- Kubuni miundombinu ya gharama nafuu kwa mazingira mengi kwa kuchagua viwango sahihi
- Kutekeleza upimaji wa utendaji na uthibitishaji wa chaguo za SKU
- Kuunda zana za kiotomatiki za mapendekezo ya SKU na uboreshaji wa gharama
- Kupanga uhamishaji wa SKU na mikakati ya kupanua kulingana na mahitaji yanayobadilika
- Kutumia kanuni za Mfumo wa Azure Well-Architected katika kuchagua viwango vya huduma

## Jedwali la Yaliyomo

- [Kuelewa SKUs](../../../../docs/pre-deployment)
- [Uchaguzi Kulingana na Mazingira](../../../../docs/pre-deployment)
- [Miongozo Maalum ya Huduma](../../../../docs/pre-deployment)
- [Mikakati ya Kupunguza Gharama](../../../../docs/pre-deployment)
- [Mambo ya Kuzingatia Kuhusu Utendaji](../../../../docs/pre-deployment)
- [Jedwali la Marejeleo ya Haraka](../../../../docs/pre-deployment)
- [Zana za Uthibitishaji](../../../../docs/pre-deployment)

---

## Kuelewa SKUs

### SKU ni Nini?

SKU (Stock Keeping Units) zinawakilisha viwango tofauti vya huduma na viwango vya utendaji kwa rasilimali za Azure. Kila SKU inatoa tofauti katika:

- **Tabia za utendaji** (CPU, kumbukumbu, kasi ya usindikaji)
- **Upatikanaji wa vipengele** (chaguzi za kupanua, viwango vya SLA)
- **Mifano ya bei** (kulingana na matumizi, uwezo uliowekwa)
- **Upatikanaji wa kanda** (si SKU zote zinapatikana katika kanda zote)

### Mambo Muhimu Katika Kuchagua SKU

1. **Mahitaji ya Mzigo wa Kazi**
   - Mwelekeo wa trafiki/mzigo unaotarajiwa
   - Mahitaji ya utendaji (CPU, kumbukumbu, I/O)
   - Mahitaji ya hifadhi na mifumo ya ufikiaji

2. **Aina ya Mazingira**
   - Maendeleo/majaribio dhidi ya uzalishaji
   - Mahitaji ya upatikanaji
   - Mahitaji ya usalama na kufuata sheria

3. **Vikwazo vya Bajeti**
   - Gharama za awali dhidi ya gharama za uendeshaji
   - Punguzo la uwezo uliowekwa
   - Athari za gharama za kupanua kiotomatiki

4. **Makadirio ya Ukuaji**
   - Mahitaji ya kupanuka
   - Mahitaji ya vipengele vya baadaye
   - Ugumu wa uhamishaji

---

## Uchaguzi Kulingana na Mazingira

### Mazingira ya Maendeleo

**Vipaumbele**: Kupunguza gharama, utendaji wa msingi, urahisi wa kuanzisha/kusitisha

#### SKU Zinazopendekezwa
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

#### Tabia
- **Huduma ya Programu**: F1 (Bure) au B1 (Msingi) kwa majaribio rahisi
- **Hifadhidata**: Kiwango cha msingi chenye rasilimali ndogo
- **Hifadhi**: Kawaida na nakala za ndani pekee
- **Kompyuta**: Rasilimali za pamoja zinakubalika
- **Mitandao**: Mipangilio ya msingi

### Mazingira ya Majaribio

**Vipaumbele**: Usanidi unaofanana na uzalishaji, uwiano wa gharama, uwezo wa kupima utendaji

#### SKU Zinazopendekezwa
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

#### Tabia
- **Utendaji**: 70-80% ya uwezo wa uzalishaji
- **Vipengele**: Vipengele vingi vya uzalishaji vimewezeshwa
- **Redundancy**: Redundancy ya kijiografia kiasi
- **Kupima**: Kupima kupanua kwa kiwango kidogo
- **Ufuatiliaji**: Mfumo kamili wa ufuatiliaji

### Mazingira ya Uzalishaji

**Vipaumbele**: Utendaji, upatikanaji, usalama, kufuata sheria, kupanuka

#### SKU Zinazopendekezwa
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

#### Tabia
- **Upatikanaji wa hali ya juu**: Mahitaji ya SLA ya 99.9%+
- **Utendaji**: Rasilimali zilizojitolea, kasi ya juu
- **Usalama**: Vipengele vya usalama wa hali ya juu
- **Kupima**: Uwezo kamili wa kupanua kiotomatiki
- **Ufuatiliaji**: Ufuatiliaji wa kina

---

## Miongozo Maalum ya Huduma

### Huduma ya Programu ya Azure

#### Jedwali la Uamuzi wa SKU

| Matumizi | SKU Inayopendekezwa | Sababu |
|----------|---------------------|--------|
| Maendeleo/Majaribio | F1 (Bure) au B1 (Msingi) | Gharama nafuu, inatosha kwa majaribio |
| Programu ndogo za uzalishaji | S1 (Kawaida) | Vikoa maalum, SSL, kupanua kiotomatiki |
| Programu za kati za uzalishaji | P1V3 (Premium V3) | Utendaji bora, vipengele zaidi |
| Programu za trafiki kubwa | P2V3 au P3V3 | Rasilimali zilizojitolea, utendaji wa hali ya juu |
| Programu muhimu | I1V2 (Isolated V2) | Kutengwa kwa mtandao, vifaa maalum |

#### Mifano ya Usanidi

**Maendeleo**
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

**Uzalishaji**
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

### Hifadhidata ya Azure SQL

#### Mfumo wa Uchaguzi wa SKU

1. **Kulingana na DTU (Database Transaction Units)**
   - **Msingi**: 5 DTU - Maendeleo/majaribio
   - **Kawaida**: S0-S12 (10-3000 DTU) - Matumizi ya jumla
   - **Premium**: P1-P15 (125-4000 DTU) - Utendaji wa hali ya juu

2. **Kulingana na vCore** (Inapendekezwa kwa uzalishaji)
   - **Madhumuni ya Jumla**: Uwiano wa usindikaji na hifadhi
   - **Biashara Muhimu**: Latency ya chini, IOPS ya juu
   - **Hyperscale**: Hifadhi inayopanuka sana (hadi 100TB)

#### Mifano ya Usanidi

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

### Huduma za Kontena za Azure

#### Aina za Mazingira

1. **Kulingana na Matumizi**
   - Bei kulingana na matumizi
   - Inafaa kwa maendeleo na mzigo wa kazi unaobadilika
   - Miundombinu ya pamoja

2. **Iliyotengwa (Profaili za Mzigo wa Kazi)**
   - Rasilimali za kompyuta zilizojitolea
   - Utendaji wa kutabirika
   - Bora kwa mzigo wa kazi wa uzalishaji

#### Mifano ya Usanidi

**Maendeleo (Kulingana na Matumizi)**
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

**Uzalishaji (Iliyotengwa)**
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

#### Miundo ya Kasi ya Usindikaji

1. **Kasi ya Usindikaji Iliyoainishwa kwa Mkono**
   - Utendaji wa kutabirika
   - Punguzo la uwezo uliowekwa
   - Bora kwa mzigo wa kazi wa kawaida

2. **Kasi ya Usindikaji Inayojipanua Kiotomatiki**
   - Kupanua kiotomatiki kulingana na matumizi
   - Kulipa kwa kile unachotumia (na kiwango cha chini)
   - Nzuri kwa mzigo wa kazi unaobadilika

3. **Serverless**
   - Kulipa kwa ombi
   - Hakuna kasi ya usindikaji iliyowekwa
   - Inafaa kwa maendeleo na mzigo wa kazi wa mara kwa mara

#### Mifano ya SKU

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

### Akaunti ya Hifadhi ya Azure

#### Aina za Akaunti za Hifadhi

1. **Standard_LRS** - Maendeleo, data isiyo muhimu
2. **Standard_GRS** - Uzalishaji, inahitaji redundancy ya kijiografia
3. **Premium_LRS** - Programu za utendaji wa hali ya juu
4. **Premium_ZRS** - Upatikanaji wa hali ya juu na redundancy ya eneo

#### Viwango vya Utendaji

- **Kawaida**: Madhumuni ya jumla, gharama nafuu
- **Premium**: Utendaji wa hali ya juu, hali ya chini ya latency

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

## Mikakati ya Kupunguza Gharama

### 1. Uwezo Uliowekwa

Weka rasilimali kwa miaka 1-3 kwa punguzo kubwa:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Kupunguza Ukubwa

Anza na SKU ndogo na kupanua kulingana na matumizi halisi:

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

### 3. Usanidi wa Kupanua Kiotomatiki

Tekeleza kupanua kwa busara ili kuboresha gharama:

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

### 4. Kupanua kwa Ratiba

Punguza ukubwa wakati wa saa za nje ya kazi:

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

## Mambo ya Kuzingatia Kuhusu Utendaji

### Mahitaji ya Msingi ya Utendaji

Tambua mahitaji ya wazi ya utendaji kabla ya kuchagua SKU:

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

### Upimaji wa Mzigo

Pima SKU tofauti ili kuthibitisha utendaji:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Ufuatiliaji na Uboreshaji

Sanidi ufuatiliaji wa kina:

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

## Jedwali la Marejeleo ya Haraka

### Marejeleo ya Haraka ya SKU za Huduma ya Programu

| SKU | Kiwango | vCPU | RAM | Hifadhi | Kiwango cha Bei | Matumizi |
|-----|---------|------|-----|---------|-----------------|----------|
| F1 | Bure | Pamoja | 1GB | 1GB | Bure | Maendeleo |
| B1 | Msingi | 1 | 1.75GB | 10GB | $ | Programu ndogo |
| S1 | Kawaida | 1 | 1.75GB | 50GB | $$ | Uzalishaji |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Utendaji wa hali ya juu |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Biashara |

### Marejeleo ya Haraka ya SKU za Hifadhidata ya SQL

| SKU | Kiwango | DTU/vCore | Hifadhi | Kiwango cha Bei | Matumizi |
|-----|---------|-----------|---------|-----------------|----------|
| Msingi | Msingi | 5 DTU | 2GB | $ | Maendeleo |
| S2 | Kawaida | 50 DTU | 250GB | $$ | Uzalishaji mdogo |
| P2 | Premium | 250 DTU | 1TB | $$$ | Utendaji wa hali ya juu |
| GP_Gen5_4 | Madhumuni ya Jumla | 4 vCore | 4TB | $$$ | Uwiano |
| BC_Gen5_8 | Biashara Muhimu | 8 vCore | 4TB | $$$$ | Muhimu |

### Marejeleo ya Haraka ya SKU za Huduma za Kontena

| Mfano | Bei | CPU/Kumbukumbu | Matumizi |
|-------|-----|---------------|----------|
| Kulingana na Matumizi | Kulipa kwa matumizi | 0.25-2 vCPU | Maendeleo, mzigo wa kazi unaobadilika |
| Iliyotengwa D4 | Imehifadhiwa | 4 vCPU, 16GB | Uzalishaji |
| Iliyotengwa D8 | Imehifadhiwa | 8 vCPU, 32GB | Utendaji wa hali ya juu |

---

## Zana za Uthibitishaji

### Kikagua Upatikanaji wa SKU

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

### Script ya Makadirio ya Gharama

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

### Uthibitishaji wa Utendaji

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

## Muhtasari wa Miongozo Bora

### Mambo ya Kufanya

1. **Anza kidogo na kupanua** kulingana na matumizi halisi
2. **Tumia SKU tofauti kwa mazingira tofauti**
3. **Fuatilia utendaji na gharama mara kwa mara**
4. **Tumia uwezo uliowekwa kwa mzigo wa kazi wa uzalishaji**
5. **Tekeleza kupanua kiotomatiki inapofaa**
6. **Pima utendaji kwa mzigo wa kazi wa kweli**
7. **Panga ukuaji lakini epuka kupanua kupita kiasi**
8. **Tumia viwango vya bure kwa maendeleo inapowezekana**

### Mambo ya Kuepuka

1. **Usitumie SKU za uzalishaji kwa maendeleo**
2. **Usipuuze upatikanaji wa SKU wa kanda**
3. **Usisahau gharama za uhamishaji wa data**
4. **Usipanue kupita kiasi bila sababu**
5. **Usipuuze athari za utegemezi**
6. **Usisanidi mipaka ya kupanua kiotomatiki kuwa juu sana**
7. **Usisahau mahitaji ya kufuata sheria**
8. **Usifanye maamuzi kulingana na bei pekee**

---

**Kidokezo cha Mtaalamu**: Tumia Azure Cost Management na Advisor kupata mapendekezo ya kibinafsi ya kuboresha chaguo zako za SKU kulingana na mifumo halisi ya matumizi.

---

**Urambazaji**
- **Somo Lililopita**: [Mipango ya Uwezo](capacity-planning.md)
- **Somo Linalofuata**: [Ukaguzi wa Awali](preflight-checks.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.