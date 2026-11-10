# Mwongozo wa Uchaguzi wa SKU - Kuchagua Ngazi Sahihi za Huduma za Azure

**Uelekezaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wakizazi](../../README.md)
- **📖 Sura Ya Sasa**: Sura ya 6 - Uthibitishaji & Mpango kabla ya Utekelezaji
- **⬅️ Iliyotangulia**: [Mipango ya Uwezo](capacity-planning.md)
- **➡️ Inayofuata**: [Ukaguzi wa Kabla ya Safari](preflight-checks.md)
- **🚀 Sura Inayofuata**: [Sura 7: Utatuzi wa Matatizo](../chapter-07-troubleshooting/common-issues.md)

## Utangulizi

Mwongozo huu wa kina utakusaidia kuchagua SKU bora zaidi za huduma za Azure (Stock Keeping Units) kwa mazingira tofauti, mizigo ya kazi, na mahitaji. Jifunze kuchambua mahitaji ya utendaji, kuzingatia gharama, na mahitaji ya upanuzi ili kuchagua ngazi za huduma zinazofaa zaidi kwa utekelezaji wa Azure Developer CLI.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utakuwa na uwezo wa:
- Kuelewa dhana za SKU za Azure, miundo ya bei, na tofauti za vipengele
- Kumiliki mbinu za uchaguzi wa SKU kulingana na mazingira kwa maendeleo, maandalizi, na uzalishaji
- Kuchambua mahitaji ya mzigo wa kazi na kuyalinganisha na ngazi zinazofaa za huduma
- Kutekeleza mbinu za uboreshaji wa gharama kupitia uchaguzi wa SKU wenye busara
- Kutumia mbinu za upimaji na uthibitishaji wa utendaji kwa chaguzi za SKU
- Kusanidi mapendekezo ya kiotomatiki ya SKU na ufuatiliaji

## Matokeo ya Kujifunza

Baada ya kumaliza, utakuwa na uwezo wa:
- Kuchagua SKU za huduma za Azure zinazofaa kulingana na mahitaji ya mzigo wa kazi na vizingiti
- Kubuni miundo ya gharama nafuu kwa mazingira mengi kwa uchaguzi sahihi wa ngazi
- Kutekeleza benchmarking ya utendaji na uthibitishaji kwa chaguzi za SKU
- Kuunda zana za kiotomatiki kwa mapendekezo ya SKU na uboreshaji wa gharama
- Kupanga mikakati ya uhamisho na upanuzi wa SKU kwa mahitaji yanayobadilika
- Kutumia kanuni za Azure Well-Architected Framework kwenye uchaguzi wa ngazi za huduma

## Jedwali la Maudhui

- [Kuelewa SKU](#understanding-skus)
- [Uchaguzi Kulingana na Mazingira](#environment-based-selection)
- [Mwongozo Maalum wa Huduma](#service-specific-guidelines)
- [Mikakati ya Uboreshaji wa Gharama](#cost-optimization-strategies)
- [Mambo ya Kuzingatia kwa Utendaji](#performance-considerations)
- [Majedwali ya Marejeo ya Haraka](#quick-reference-tables)
- [Zana za Uthibitishaji](#validation-tools)

---

## Kuelewa SKU

> **Mfano wa upeo:** Ramani za SKU za YAML na usanidi wa utendaji hapo chini ni maelezo ya muundo, si muundo wa `azure.yaml` au usanidi wa zana ya mzigo. Vipande vya Bicep ni mbadala/tukio: tambulisha vigezo vyake na rasilimali za mzazi, tumia majina ya kipekee unapoziunganisha, na unganisha moduli katika mradi unaofanya kazi. Bei, mipaka, na upatikane wa kanda/SKU lazima ukague kwa usajili wako kabla ya utekelezaji.

### SKU ni Nini?

SKU (Stock Keeping Units) zinawakilisha ngazi tofauti za huduma na viwango vya utendaji kwa rasilimali za Azure. Kila SKU hutoa tofauti:

- **Tabia za Utendaji** (CPU, kumbukumbu, upitishaji)
- **Upatikanaji wa Kipengele** (chaguzi za upanuzi, viwango vya SLA)
- **Miundo ya Bei** (kutumia kulingana na matumizi, uwezo ulihifadhiwa)
- **Upatikanaji wa Kanda** (si SKU zote zinapatikana katika kanda zote)

### Vigezo Muhimu Katika Uchaguzi wa SKU

1. **Mahitaji ya Mzigo wa Kazi**
   - Mienendo ya trafiki/mzigo inayotarajiwa
   - Mahitaji ya utendaji (CPU, kumbukumbu, I/O)
   - Mahitaji ya hifadhi na mifumo ya upatikanaji

2. **Aina ya Mazingira**
   - Maendeleo/kupima dhidi ya uzalishaji
   - Mahitaji ya upatikanaji
   - Mahitaji ya usalama na uzingatiaji

3. **Vizingiti vya Bajeti**
   - Gharama za awali dhidi ya gharama za uendeshaji
   - Punguzo la uwezo ulihifadhiwa
   - Athari za gharama za upanuzi wa kiotomatiki

4. **Makadirio ya Ukuaji**
   - Mahitaji ya upanuzi
   - Mahitaji ya vipengele vya baadaye
   - Ugumu wa uhamisho

---

## Uchaguzi Kulingana na Mazingira

### Mazingira ya Maendeleo

**Kipaumbele**: Uboreshaji wa gharama, utendaji wa msingi, urahisi wa ugawaji/utoa

#### SKU Zinazopendekezwa
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

#### Tabia
- **Huduma za App**: F1 (Bure) au B1 (Msingi) kwa majaribio rahisi
- **Misingi ya Data**: Ngazi ya msingi na rasilimali zisizo nyingi
- **Hifadhi**: Kawaida na upyaaji wa ndani pekee
- **Hisabati**: Rasilimali za pamoja zinakubalika
- **Mitandao**: Usanidi wa msingi

### Mazingira ya Maandalizi/Ukipima

**Kipaumbele**: Usanidi kama uzalishaji, usawa wa gharama, uwezo wa kupima utendaji

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
- **Upyaaji**: Baadhi ya upyaaji wa kijiografia
- **Upanuzi**: Upanuzi wa kiotomatiki mdogo kwa majaribio
- **Ufuatiliaji**: Stack kamili ya ufuatiliaji

### Mazingira ya Uzalishaji

**Kipaumbele**: Utendaji, upatikanaji, usalama, uzingatiaji, upanuzi

#### SKU Zinazopendekezwa
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

#### Tabia
- **Upatikanaji wa Juu**: Mahitaji ya SLA 99.9%+
- **Utendaji**: Rasilimali zilizojitolea, upitishaji mkubwa
- **Usalama**: Vipengele vya usalama vya premium
- **Upanuzi**: Uwezo kamili wa upanuzi wa kiotomatiki
- **Ufuatiliaji**: Uwezo wa kuangalia kwa kina

---

## Mwongozo Maalum wa Huduma

### Huduma ya Azure App

#### Mkataba wa Uamuzi wa SKU

| Matumizi | SKU Inayopendekezwa | Sababu |
|----------|----------------|-----------|
| Maendeleo/Ukipima | F1 (Bure) au B1 (Msingi) | Gharama nafuu, imefaa kwa majaribio |
| Programu ndogo za uzalishaji | S1 (Kawaida) | Kanda za desturi, SSL, upanuzi wa kiotomatiki |
| Programu za uzalishaji wa kati | P1V3 (Premium V3) | Utendaji bora, vipengele zaidi |
| Programu zenye trafiki kubwa | P2V3 au P3V3 | Rasilimali zilizojitolea, utendaji wa juu |
| Programu muhimu kwa misheni | I1V2 (Isolated V2) | Utoaji wa mtandao, vifaa vilivyojitolea |

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

1. **Msingi wa DTU (Units za Muamala wa Hifadhidata)**
   - **Msingi**: 5 DTU - Maendeleo/ukipima
   - **Kawaida**: S0-S12 (10-3000 DTU) - Madhumuni ya jumla
   - **Premium**: P1-P15 (125-4000 DTU) - Muhimu kwa utendaji

2. **Msingi wa vCore** (Inapendekezwa kwa uzalishaji)
   - **Madhumuni ya Jumla**: Usimbaji sawia wa hisabati na hifadhi
   - **Biashara Muhimu**: Ugumu wa pungufu, IOPS za juu
   - **Hyperscale**: Hifadhi inayopanuka sana; hakikisha mipaka na msaada wa kanda za sasa

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

### Programu za Kontena za Azure

#### Aina za Mazingira

1. **Kulingana na Matumizi**
   - Malipo kulingana na matumizi
   - Inafaa kwa maendeleo na mizigo inayobadilika
   - Miundombinu ya pamoja

2. **Zilizojitolea (Profaili za Mizigo)**
   - Rasilimali za hisabati zilizojiwekea
   - Utendaji unaotabirika
   - Bora kwa mizigo ya uzalishaji

#### Mifano ya Usanidi

**Maendeleo (Matumizi)**
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

**Uzalishaji (Zilizojitolea)**
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

Upaya wa upyaaji wa maeneo pia unahitaji miundombinu ya kanda inayoungwa mkono na usanidi mzuri wa VNet/subnet, haijawekwa hapa. Mfano huu unajumuisha nodi tatu zilizojiwekea; sanidi angalau nakala mbili za app kwa usambazaji wa maeneo na pima nakala na nodi kwa kushindwa kwa eneo. Angalia [Mwongozo wa Uaminifu wa Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Ili kuweka app kwenye profaili hii, weka `workloadProfileName: 'production-profile'`; kuunda profaili pekee hakuhamishi apps kwenye hiyo.

### Azure Cosmos DB

#### Miundo ya Upitishaji

1. **Upitishaji wa Kusudiwa kwa Mikono**
   - Utendaji unaotabirika
   - Punguzo la uwezo ulihifadhiwa
   - Bora kwa mizigo thabiti

2. **Upitishaji wa Kiotomatiki**
   - Upanuzi wa kiotomatiki kulingana na matumizi
   - Lipa unachotumia (kwa kiwango cha chini)
   - Nzuri kwa mizigo inayobadilika

3. **Serverless**
   - Lipa kwa ombi
   - Hakuna upitishaji uliopangwa
   - Inafaa kwa maendeleo na mizigo ya vipindi

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

1. **Standard_LRS** - Maendeleo, data zisizo muhimu
2. **Standard_GRS** - Uzalishaji, inahitaji upyaaji wa kijiografia
3. **Premium_LRS** - Programu za utendaji wa juu
4. **Premium_ZRS** - Upatikanaji wa juu na upyaaji wa maeneo

#### Ngazi za Utendaji

- **Kawaida**: Madhumuni ya jumla, gharama nafuu
- **Premium**: Utendaji wa juu, hali za kuchelewesha kidogo

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

### 1. Uwezo Ulihifadhiwa

Hifadhi rasilimali kwa miaka 1-3 kwa punguzo kubwa:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Matoleo ya uhifadhi na aina za rasilimali zinazostahiki zinatofautiana; chunguza katalogi na masharti ya ununuzi badala ya kudhani kila huduma/SKU inaunga mkono uhifadhi.

### 2. Ukipaji Sahihi

Anza na SKU ndogo na pandisha kulingana na matumizi halisi:

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

### 3. Usanidi wa Upanuzi wa Kiotomatiki

Tekeleza upanuzi wenye busara ili uboresha gharama:

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

### 4. Upanuzi uliopangwa

Punguza wakati wa saa zisizohitaji:

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

## Mambo ya Kuzingatia ya Utendaji

### Mahitaji ya Msingi ya Utendaji

Tafsiri mahitaji ya utendaji kabla ya uchaguzi wa SKU:

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

Jaribu SKU tofauti kuthibitisha utendaji:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Ufuatiliaji na Uboreshaji

Sanidi ufuatiliaji mpana:

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

## Majedwali ya Marejeo ya Haraka

### Marejeo ya Haraka ya SKU za Huduma za App

| SKU | Ngazi | vCPU | RAM | Hifadhi | Mipaka ya Bei | Matumizi |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Bure | Zilizogawanywa | 1GB | 1GB | Bure | Maendeleo |
| B1 | Msingi | 1 | 1.75GB | 10GB | $ | Programu ndogo |
| S1 | Kawaida | 1 | 1.75GB | 50GB | $$ | Uzalishaji |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Utendaji wa Juu |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Kampuni |

### Marejeo ya Haraka ya SKU za Hifadhidata za SQL

| SKU | Ngazi | DTU/vCore | Hifadhi | Mipaka ya Bei | Matumizi |
|-----|------|-----------|---------|-------------|----------|
| Msingi | Msingi | 5 DTU | 2GB | $ | Maendeleo |
| S2 | Kawaida | 50 DTU | 250GB | $$ | Uzalishaji mdogo |
| P2 | Premium | 250 DTU | 1TB | $$$ | Utendaji wa Juu |
| GP_Gen5_4 | Madhumuni ya Jumla | 4 vCore | 4TB | $$$ | Sawia |
| BC_Gen5_8 | Biashara Muhimu | 8 vCore | 4TB | $$$$ | Muhimu kwa misheni |

### Marejeo ya Haraka ya SKU za Programu za Kontena

| Mfano | Bei | CPU/Kumbukumbu | Matumizi |
|-------|---------|------------|----------|
| Matumizi | Lipa kwa matumizi | Mchanganyiko wa CPU/kumbukumbu unaoungwa mkono unategemea mazingira/profayili | Maendeleo au uzalishaji, mzigo unaobadilika |
| D4 Iliyojitolea | Malipo kwa nodi iliyojitolea | 4 vCPU, 16GiB kwa nodi | Mahitaji ya mzigo unaodumu/vipengele vya upatanishi |
| D8 Iliyojitolea | Malipo kwa nodi iliyojitolea | 8 vCPU, 32GiB kwa nodi | Mzigo mkubwa unaodumu |

---

## Zana za Uthibitishaji

### Kichunguzi cha Upatikanaji wa SKU

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

### Msimbo wa Makadirio ya Gharama

**Pseudocode tu:** `Get-ResourceCost` hapo chini ni kazi maalum ya mradi ambayo lazima utekeleze kwa kutumia bei za sasa za kanda/mkataba na mawazo ya matumizi. Sio PowerShell au cmdlet ya Azure.

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

YAML ifuatayo ni mchoro wa mahitaji, **sio** muundo wa pembejeo wa Azure Load Testing, JMeter, Locust, au k6. Itafsiri kwenye zana uliyochagua kabla ya kutumia amri ya mtihani wa mzigo hapo juu.

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

## Muhtasari wa Mbinu Bora

### Kazi za Kufanya

1. **Anza kidogo na panda kulingana na matumizi halisi**
2. **Tumia SKU tofauti kwa mazingira tofauti**
3. **Fuatilia utendaji na gharama kwa daima**
4. **Tumia uwezo ulihifadhiwa kwa mizigo ya uzalishaji**
5. **Tekeleza upanuzi wa kiotomatiki inapofaa**
6. **Pima utendaji na mizigo halisi**
7. **Panga ukuaji lakini epuka kutoa rasilimali kupita kiasi**
8. **Tumia ngazi za bure kwa maendeleo inapowezekana**

### Kosa za Kuepuka

1. **Usitumie SKU za uzalishaji kwa maendeleo**
2. **Usipuuzie upatikanaji wa SKU wa kanda**
3. **Usisahau gharama za uhamishaji wa data**
4. **Usitoe rasilimali kupita kiasi bila sababu**
5. **Usipuuzie athari za utegemezi**
6. **Usiwe na mipaka ya upanuzi wa kiotomatiki kwa kiwango cha juu mno**
7. **Usisahau mahitaji ya uzingatiaji**
8. **Usichague kwa bei peke yake**

---

**Ushauri Maalum**: Tumia Azure Cost Management na Advisor kupata mapendekezo binafsi ya kuboresha uchaguzi wa SKU kulingana na mienendo halisi ya matumizi.

---

**Uelekezaji**
- **Somo Lililotangulia**: [Mipango ya Uwezo](capacity-planning.md)
- **Somu Linalofuata**: [Ukaguzi wa Kabla ya Safari](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->