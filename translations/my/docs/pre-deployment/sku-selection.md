# SKU ရွေးချယ်မှုလမ်းညွှန် - Azure Service Tiers ကိုမှန်ကန်စွာရွေးချယ်ခြင်း

**အခန်းအကြောင်းအရာ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၆ - Pre-Deployment Validation & Planning
- **⬅️ ယခင်**: [Capacity Planning](capacity-planning.md)
- **➡️ နောက်တစ်ခု**: [Pre-flight Checks](preflight-checks.md)
- **🚀 နောက်အခန်း**: [အခန်း ၇: Troubleshooting](../troubleshooting/common-issues.md)

## အကျဉ်းချုပ်

ဒီလမ်းညွှန်စာအုပ်က Azure service SKUs (Stock Keeping Units) ကို အခြေအနေများ၊ workload များနှင့် လိုအပ်ချက်များအတွက် အကောင်းဆုံးရွေးချယ်နိုင်ရန် ကူညီပေးပါမည်။ Performance လိုအပ်ချက်များ၊ ကုန်ကျစရိတ်စဉ်းစားမှုများနှင့် scalability လိုအပ်ချက်များကို ခွဲခြမ်းစိတ်ဖြာပြီး Azure Developer CLI deployments အတွက် သင့်တော်သော service tiers ကို ရွေးချယ်နိုင်ရန် လေ့လာပါ။

## သင်ယူရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကိုပြီးမြောက်စွာလေ့လာပြီးနောက်၊ သင်သည်:
- Azure SKU အကြောင်းအရာများ၊ စျေးနှုန်းပုံစံများနှင့် အင်္ဂါရပ်ကွာခြားချက်များကို နားလည်နိုင်မည်
- Development, staging, production အတွက် environment-specific SKU ရွေးချယ်မှုနည်းလမ်းများကို ကျွမ်းကျင်နိုင်မည်
- Workload လိုအပ်ချက်များကို ခွဲခြမ်းစိတ်ဖြာပြီး သင့်တော်သော service tiers နှင့် ကိုက်ညီစေရန် ရွေးချယ်နိုင်မည်
- SKU ရွေးချယ်မှုမှတဆင့် ကုန်ကျစရိတ်ကို အကျိုးရှိစွာ လျှော့ချနိုင်မည်
- SKU ရွေးချယ်မှုအတွက် performance စမ်းသပ်မှုနှင့် အတည်ပြုနည်းလမ်းများကို အသုံးချနိုင်မည်
- SKU အကြံပြုမှုနှင့် မျှဝေမှုကို အလိုအလျောက် configure လုပ်နိုင်မည်

## သင်ယူရလဒ်များ

ပြီးမြောက်ပြီးနောက်၊ သင်သည်:
- Workload လိုအပ်ချက်များနှင့် အကန့်အသတ်များအပေါ် အခြေခံပြီး သင့်တော်သော Azure service SKUs ကို ရွေးချယ်နိုင်မည်
- Multi-environment architectures ကို ကုန်ကျစရိတ်သက်သာစွာ ဒီဇိုင်းဆွဲနိုင်မည်
- SKU ရွေးချယ်မှုအတွက် performance benchmarking နှင့် validation ကို အကောင်အထည်ဖော်နိုင်မည်
- SKU recommendation နှင့် cost optimization အတွက် အလိုအလျောက် tools များကို ဖန်တီးနိုင်မည်
- လိုအပ်ချက်များပြောင်းလဲလာသည်နှင့်အမျှ SKU migration နှင့် scaling strategies များကို စီမံနိုင်မည်
- Azure Well-Architected Framework principles ကို service tier ရွေးချယ်မှုတွင် အသုံးချနိုင်မည်

## အကြောင်းအရာများ

- [SKUs ကိုနားလည်ခြင်း](../../../../docs/pre-deployment)
- [Environment အခြေခံ ရွေးချယ်မှု](../../../../docs/pre-deployment)
- [Service-Specific လမ်းညွှန်ချက်များ](../../../../docs/pre-deployment)
- [ကုန်ကျစရိတ် လျှော့ချနည်းလမ်းများ](../../../../docs/pre-deployment)
- [Performance ကိုစဉ်းစားခြင်း](../../../../docs/pre-deployment)
- [Quick Reference Tables](../../../../docs/pre-deployment)
- [Validation Tools](../../../../docs/pre-deployment)

---

## SKUs ကိုနားလည်ခြင်း

### SKUs ဆိုတာဘာလဲ?

SKUs (Stock Keeping Units) ဆိုတာ Azure resources အတွက် service tiers နှင့် performance အဆင့်များကို ကိုယ်စားပြုသည်။ SKU တစ်ခုစီမှာ အောက်ပါအရာများကို ကွဲပြားစွာပေးသည်။

- **Performance လက္ခဏာများ** (CPU, memory, throughput)
- **အင်္ဂါရပ်ရရှိနိုင်မှု** (scaling options, SLA အဆင့်များ)
- **စျေးနှုန်းပုံစံများ** (consumption-based, reserved capacity)
- **ဒေသအလိုက်ရရှိနိုင်မှု** (SKUs အားလုံးကို ဒေသအားလုံးတွင် မရရှိနိုင်)

### SKU ရွေးချယ်မှုအတွက် အဓိကအချက်များ

1. **Workload လိုအပ်ချက်များ**
   - မျှော်မှန်းထားသော traffic/load ပုံစံများ
   - Performance လိုအပ်ချက်များ (CPU, memory, I/O)
   - Storage လိုအပ်ချက်များနှင့် access ပုံစံများ

2. **Environment အမျိုးအစား**
   - Development/testing နှင့် production
   - Availability လိုအပ်ချက်များ
   - Security နှင့် compliance လိုအပ်ချက်များ

3. **Budget အကန့်အသတ်များ**
   - စတင်ကုန်ကျစရိတ်နှင့် လုပ်ငန်းစဉ်ကုန်ကျစရိတ်
   - Reserved capacity လျှော့စျေးများ
   - Auto-scaling ကုန်ကျစရိတ်ရလဒ်များ

4. **အနာဂတ်တိုးတက်မှုများ**
   - Scalability လိုအပ်ချက်များ
   - အနာဂတ် feature လိုအပ်ချက်များ
   - Migration ရှုပ်ထွေးမှု

---

## Environment အခြေခံ ရွေးချယ်မှု

### Development Environment

**အရေးပါချက်များ**: ကုန်ကျစရိတ်သက်သာမှု၊ အခြေခံ functionality၊ provisioning/de-provisioning လွယ်ကူမှု

#### အကြံပြုထားသော SKUs
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

#### လက္ခဏာများ
- **App Service**: F1 (Free) သို့မဟုတ် B1 (Basic) - ရိုးရှင်းသော စမ်းသပ်မှုအတွက်
- **Databases**: အနည်းဆုံး resource များပါဝင်သော Basic tier
- **Storage**: Standard နှင့် local redundancy သာ
- **Compute**: Shared resources လက်ခံနိုင်
- **Networking**: အခြေခံ configuration များ

### Staging/Testing Environment

**အရေးပါချက်များ**: Production-like configuration, ကုန်ကျစရိတ်နှင့် performance စမ်းသပ်မှုစွမ်းရည်

#### အကြံပြုထားသော SKUs
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

#### လက္ခဏာများ
- **Performance**: Production capacity ၏ 70-80%
- **Features**: Production features များအများစု enabled
- **Redundancy**: အချို့ geographic redundancy
- **Scaling**: စမ်းသပ်မှုအတွက် auto-scaling အနည်းငယ်
- **Monitoring**: Full monitoring stack

### Production Environment

**အရေးပါချက်များ**: Performance, availability, security, compliance, scalability

#### အကြံပြုထားသော SKUs
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

#### လက္ခဏာများ
- **High availability**: 99.9%+ SLA လိုအပ်ချက်များ
- **Performance**: Dedicated resources, high throughput
- **Security**: Premium security features
- **Scaling**: Full auto-scaling စွမ်းရည်များ
- **Monitoring**: Comprehensive observability

---

## Service-Specific လမ်းညွှန်ချက်များ

### Azure App Service

#### SKU ရွေးချယ်မှု Matrix

| အသုံးပြုမှု | အကြံပြုထားသော SKU | အကြောင်းပြချက် |
|-------------|---------------------|----------------|
| Development/Testing | F1 (Free) သို့မဟုတ် B1 (Basic) | ကုန်ကျစရိတ်သက်သာမှု၊ စမ်းသပ်မှုအတွက် လုံလောက်သည် |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | ပိုမိုကောင်းမွန်သော performance၊ feature များပိုများ |
| High-traffic apps | P2V3 သို့မဟုတ် P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### Configuration ဥပမာများ

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

#### SKU ရွေးချယ်မှု Framework

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - Development/testing
   - **Standard**: S0-S12 (10-3000 DTU) - General purpose
   - **Premium**: P1-P15 (125-4000 DTU) - Performance-critical

2. **vCore-based** (Production အတွက် အကြံပြုသည်)
   - **General Purpose**: Compute နှင့် storage အချိုးညီ
   - **Business Critical**: Low latency, high IOPS
   - **Hyperscale**: Highly scalable storage (100TB အထိ)

#### Configuration ဥပမာများ

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

#### Environment အမျိုးအစားများ

1. **Consumption-based**
   - Pay-per-use စျေးနှုန်း
   - Development နှင့် variable workloads အတွက် သင့်တော်သည်
   - Shared infrastructure

2. **Dedicated (Workload Profiles)**
   - Dedicated compute resources
   - Predictable performance
   - Production workloads အတွက် ပိုကောင်းသည်

#### Configuration ဥပမာများ

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
   - Predictable performance
   - Reserved capacity လျှော့စျေးများ
   - Steady workloads အတွက် အကောင်းဆုံး

2. **Autoscale Provisioned Throughput**
   - Usage အပေါ်မူတည်ပြီး အလိုအလျောက် scaling
   - Pay for what you use (minimum ပါရှိသည်)
   - Variable workloads အတွက် သင့်တော်သည်

3. **Serverless**
   - Pay-per-request
   - Provisioned throughput မလိုအပ်
   - Development နှင့် intermittent workloads အတွက် အကောင်းဆုံး

#### SKU ဥပမာများ

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

#### Storage Account အမျိုးအစားများ

1. **Standard_LRS** - Development, non-critical data
2. **Standard_GRS** - Production, geo-redundancy လိုအပ်သော data
3. **Premium_LRS** - High-performance applications
4. **Premium_ZRS** - Zone redundancy ဖြင့် အမြင့်ဆုံး availability

#### Performance Tiers

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

## ကုန်ကျစရိတ် လျှော့ချနည်းလမ်းများ

### 1. Reserved Capacity

1-3 နှစ်အတွက် resources ကို reserve လုပ်ပြီး လျှော့စျေးရယူပါ:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

အသုံးပြုမှုအပေါ်မူတည်ပြီး သေးငယ်သော SKUs ဖြင့် စတင်ပြီး အလိုအလျောက် တိုးမြှင့်ပါ:

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

Intelligent scaling ကို အသုံးပြုပြီး ကုန်ကျစရိတ်ကို optimize လုပ်ပါ:

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

Off-hours တွင် scale down လုပ်ပါ:

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

## Performance ကိုစဉ်းစားခြင်း

### Baseline Performance လိုအပ်ချက်များ

SKU ရွေးချယ်မှုမပြုမီ performance လိုအပ်ချက်များကို ရှင်းလင်းစွာ သတ်မှတ်ပါ:

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

Performance ကို အတည်ပြုရန် SKU များကို စမ်းသပ်ပါ:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring နှင့် Optimization

Comprehensive monitoring ကို စနစ်တကျ စီစဉ်ပါ:

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

## Validation Tools

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

## အကောင်းဆုံးအလေ့အကျင့်များ

### လုပ်သင့်သောအရာများ

1. **အသုံးပြုမှုအပေါ်မူတည်ပြီး သေးငယ်စွာစတင်ပြီး တိုးမြှင့်ပါ**
2. **အခြားအခြေအနေများအတွက် ကွဲပြားသော SKUs ကို အသုံးပြုပါ**
3. **Performance နှင့် ကုန်ကျစရိတ်ကို ဆက်လက်စောင့်ကြည့်ပါ**
4. **Production workloads အတွက် reserved capacity ကို အသုံးပြုပါ**
5. **သင့်တော်သောနေရာတွင် auto-scaling ကို အသုံးပြုပါ**
6. **Workload အမှန်တကယ်ဖြင့် performance ကို စမ်းသပ်ပါ**
7. **တိုးတက်မှုအတွက် စီမံကိန်းရေးဆွဲပါ၊ over-provisioning မလုပ်ပါနှင့်**
8. **Development အတွက် free tiers ကို အသုံးပြုပါ**

### မလုပ်သင့်သောအရာများ

1. **Development အတွက် production SKUs ကို မသုံးပါနှင့်**
2. **Regional SKU ရရှိနိုင်မှုကို မလွဲမသွေ စဉ်းစားပါ**
3. **Data transfer ကုန်ကျစရိတ်ကို မမေ့ပါနှင့်**
4. **အကြောင်းမရှိဘဲ over-provisioning မလုပ်ပါနှင့်**
5. **Dependencies ၏ အကျိုးသက်ရောက်မှုကို မလွဲမသွေ စဉ်းစားပါ**
6. **Auto-scaling limits ကို များလွန်းစွာ မထားပါနှင့်**
7. **Compliance လိုအပ်ချက်များကို မမေ့ပါနှင့်**
8. **စျေးနှုန်းအပေါ်သာမူတည်ပြီး ဆုံးဖြတ်ချက်မလုပ်ပါနှင့်**

---

**Pro Tip**: Azure Cost Management နှင့် Advisor ကို အသုံးပြုပြီး သင့် SKU ရွေးချယ်မှုများကို အသုံးပြုမှုပုံစံများအပေါ်မူတည်၍ အကောင်းဆုံး optimize လုပ်နိုင်ရန် အကြံပြုချက်များရယူပါ။

---

**Navigation**
- **ယခင်သင်ခန်းစာ**: [Capacity Planning](capacity-planning.md)
- **နောက်သင်ခန်းစာ**: [Preflight Checks](preflight-checks.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေပါသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွဲအချော်များ သို့မဟုတ် အနားယူမှုမှားများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။