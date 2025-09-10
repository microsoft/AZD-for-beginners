<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-10T06:55:01+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "my"
}
-->
# SKU ရွေးချယ်မှုလမ်းညွှန် - Azure ဝန်ဆောင်မှုအဆင့်များကိုမှန်ကန်စွာရွေးချယ်ခြင်း

## အကျဉ်းချုပ်

ဤလမ်းညွှန်သည် အခြားအခြေအနေများ၊ အလုပ်ပုံစံများနှင့် လိုအပ်ချက်များအတွက် Azure ဝန်ဆောင်မှု SKUs (Stock Keeping Units) ကို အကောင်းဆုံးရွေးချယ်ရန် ကူညီပေးပါသည်။ Azure Developer CLI deployments အတွက် အဆင့်များကို ရွေးချယ်ရာတွင် စွမ်းဆောင်ရည်လိုအပ်ချက်များ၊ ကုန်ကျစရိတ်စဉ်းစားမှုများနှင့် အရွယ်အစားချဲ့ထွင်မှုလိုအပ်ချက်များကို လေ့လာသုံးသပ်ရန် လေ့လာပါ။

## လေ့လာရမည့်ရည်ရွယ်ချက်များ

ဤလမ်းညွှန်ကိုပြီးစီးခြင်းဖြင့် သင်သည်:
- Azure SKU အယူအဆများ၊ စျေးနှုန်းပုံစံများနှင့် အင်္ဂါရပ်ကွာခြားချက်များကို နားလည်မည်
- ဖွံ့ဖြိုးရေး၊ စမ်းသပ်မှုနှင့် ထုတ်လုပ်မှုအတွက် အခြေအနေအလိုက် SKU ရွေးချယ်မှုနည်းဗျူဟာများကို ကျွမ်းကျင်မည်
- အလုပ်ပုံစံလိုအပ်ချက်များကို သုံးသပ်ပြီး သင့်လျော်သော ဝန်ဆောင်မှုအဆင့်များနှင့် ကိုက်ညီစေရန် ရွေးချယ်မည်
- SKU ရွေးချယ်မှုမှတဆင့် ကုန်ကျစရိတ်အခွင့်အရေးများကို အကျိုးရှိစွာ အကောင်အထည်ဖော်မည်
- SKU ရွေးချယ်မှုများအတွက် စွမ်းဆောင်ရည်စမ်းသပ်မှုနှင့် အတည်ပြုနည်းလမ်းများကို အသုံးပြုမည်
- SKU အကြံပြုချက်များနှင့် စောင့်ကြည့်မှုကို အလိုအလျောက်ဖွဲ့စည်းမည်

## လေ့လာပြီးရရှိမည့်ရလဒ်များ

ပြီးစီးခြင်းဖြင့် သင်သည်:
- အလုပ်ပုံစံလိုအပ်ချက်များနှင့် အကန့်အသတ်များအပေါ် အခြေခံ၍ သင့်လျော်သော Azure ဝန်ဆောင်မှု SKUs ကို ရွေးချယ်နိုင်မည်
- အဆင့်ရွေးချယ်မှုမှန်ကန်သော အဆင့်များဖြင့် ကုန်ကျစရိတ်သက်သာသော အမျိုးမျိုးသောအခြေအနေများအတွက် architecture များကို ဒီဇိုင်းဆွဲနိုင်မည်
- SKU ရွေးချယ်မှုများအတွက် စွမ်းဆောင်ရည် benchmarking နှင့် အတည်ပြုမှုကို အကောင်အထည်ဖော်နိုင်မည်
- SKU အကြံပြုချက်နှင့် ကုန်ကျစရိတ်အခွင့်အရေးများအတွက် အလိုအလျောက် tools များကို ဖန်တီးနိုင်မည်
- လိုအပ်ချက်များပြောင်းလဲမှုအတွက် SKU ပြောင်းရွှေ့မှုနှင့် အရွယ်အစားချဲ့ထွင်မှုနည်းဗျူဟာများကို စီမံနိုင်မည်
- Azure Well-Architected Framework ကို ဝန်ဆောင်မှုအဆင့်ရွေးချယ်မှုတွင် အသုံးပြုနိုင်မည်

## အကြောင်းအရာများ

- [SKUs ကိုနားလည်ခြင်း](../../../../docs/pre-deployment)
- [အခြေအနေအလိုက်ရွေးချယ်မှု](../../../../docs/pre-deployment)
- [ဝန်ဆောင်မှုအလိုက်လမ်းညွှန်ချက်များ](../../../../docs/pre-deployment)
- [ကုန်ကျစရိတ်သက်သာမှုနည်းဗျူဟာများ](../../../../docs/pre-deployment)
- [စွမ်းဆောင်ရည်စဉ်းစားမှုများ](../../../../docs/pre-deployment)
- [အမြန်ရည်ညွှန်းဇယားများ](../../../../docs/pre-deployment)
- [အတည်ပြုမှု tools](../../../../docs/pre-deployment)

---

## SKUs ကိုနားလည်ခြင်း

### SKUs ဆိုတာဘာလဲ?

SKUs (Stock Keeping Units) သည် Azure ရင်းမြစ်များအတွက် ဝန်ဆောင်မှုအဆင့်များနှင့် စွမ်းဆောင်ရည်အဆင့်များကို ကိုယ်စားပြုသည်။ SKU တစ်ခုစီတွင် အောက်ပါအချက်များကွာခြားမှုရှိသည်-

- **စွမ်းဆောင်ရည်လက္ခဏာများ** (CPU, memory, throughput)
- **အင်္ဂါရပ်ရရှိနိုင်မှု** (scaling options, SLA အဆင့်များ)
- **စျေးနှုန်းပုံစံများ** (သုံးစွဲမှုအပေါ်အခြေခံ, reserved capacity)
- **ဒေသအလိုက်ရရှိနိုင်မှု** (SKUs အားလုံးသည် ဒေသအားလုံးတွင်ရရှိနိုင်မည်မဟုတ်)

### SKU ရွေးချယ်မှုတွင် အရေးကြီးသောအချက်များ

1. **အလုပ်ပုံစံလိုအပ်ချက်များ**
   - မျှော်မှန်းထားသော traffic/load ပုံစံများ
   - စွမ်းဆောင်ရည်လိုအပ်ချက်များ (CPU, memory, I/O)
   - သိုလှောင်မှုလိုအပ်ချက်များနှင့် အသုံးပြုမှုပုံစံများ

2. **အခြေအနေအမျိုးအစား**
   - ဖွံ့ဖြိုးရေး/စမ်းသပ်မှုနှင့် ထုတ်လုပ်မှု
   - ရရှိနိုင်မှုလိုအပ်ချက်များ
   - လုံခြုံရေးနှင့် အညီအနေလိုအပ်ချက်များ

3. **ဘတ်ဂျက်ကန့်သတ်ချက်များ**
   - စတင်ကုန်ကျစရိတ်နှင့် လုပ်ငန်းစဉ်ကုန်ကျစရိတ်
   - Reserved capacity လျော့စျေးများ
   - Auto-scaling ကုန်ကျစရိတ်ရလဒ်များ

4. **တိုးတက်မှုခန့်မှန်းချက်များ**
   - အရွယ်အစားချဲ့ထွင်မှုလိုအပ်ချက်များ
   - အနာဂတ်အင်္ဂါရပ်လိုအပ်ချက်များ
   - ပြောင်းရွှေ့မှုအခက်အခဲ

---

## အခြေအနေအလိုက်ရွေးချယ်မှု

### ဖွံ့ဖြိုးရေးအခြေအနေ

**အရေးထားရမည့်အချက်များ**: ကုန်ကျစရိတ်သက်သာမှု၊ အခြေခံလုပ်ဆောင်နိုင်မှု၊ အလွယ်တကူ provision/de-provision

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
- **App Service**: F1 (Free) သို့မဟုတ် B1 (Basic) - ရိုးရှင်းသောစမ်းသပ်မှုအတွက်
- **Databases**: အနည်းဆုံး resources ဖြင့် Basic tier
- **Storage**: Standard (ဒေသတွင်း redundancy)
- **Compute**: Shared resources
- **Networking**: ရိုးရှင်းသော configuration

### စမ်းသပ်/စမ်းသပ်မှုအခြေအနေ

**အရေးထားရမည့်အချက်များ**: ထုတ်လုပ်မှုနှင့်တူသော configuration၊ ကုန်ကျစရိတ်နှင့် စွမ်းဆောင်ရည်စမ်းသပ်မှု

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
- **စွမ်းဆောင်ရည်**: ထုတ်လုပ်မှုစွမ်းဆောင်ရည်၏ 70-80%
- **အင်္ဂါရပ်များ**: ထုတ်လုပ်မှုအင်္ဂါရပ်များအများစုကို enabled
- **Redundancy**: တချို့သောဒေသဆိုင်ရာ redundancy
- **Scaling**: စမ်းသပ်မှုအတွက် အကန့်အသတ် auto-scaling
- **Monitoring**: စုံလင်သော monitoring stack

### ထုတ်လုပ်မှုအခြေအနေ

**အရေးထားရမည့်အချက်များ**: စွမ်းဆောင်ရည်၊ ရရှိနိုင်မှု၊ လုံခြုံရေး၊ အညီအနေ၊ အရွယ်အစားချဲ့ထွင်မှု

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
- **ရရှိနိုင်မှုမြင့်မားမှု**: 99.9%+ SLA လိုအပ်ချက်များ
- **စွမ်းဆောင်ရည်**: Dedicated resources, throughput မြင့်မားမှု
- **လုံခြုံရေး**: Premium လုံခြုံရေး features
- **Scaling**: အပြည့်အဝ auto-scaling စွမ်းဆောင်ရည်
- **Monitoring**: စုံလင်သော observability

---

## ဝန်ဆောင်မှုအလိုက်လမ်းညွှန်ချက်များ

### Azure App Service

#### SKU ဆုံးဖြတ်ချက် Matrix

| အသုံးပြုမှု | အကြံပြုထားသော SKU | အကြောင်းပြချက် |
|-------------|---------------------|----------------|
| ဖွံ့ဖြိုးရေး/စမ်းသပ်မှု | F1 (Free) သို့မဟုတ် B1 (Basic) | ကုန်ကျစရိတ်သက်သာမှု၊ စမ်းသပ်မှုအတွက်လုံလောက်မှု |
| အသေးစားထုတ်လုပ်မှု app များ | S1 (Standard) | Custom domains, SSL, auto-scaling |
| အလတ်စားထုတ်လုပ်မှု app များ | P1V3 (Premium V3) | စွမ်းဆောင်ရည်ပိုမိုကောင်းမွန်မှု၊ အင်္ဂါရပ်များပိုမိုများပြားမှု |
| Traffic မြင့်မားသော app များ | P2V3 သို့မဟုတ် P3V3 | Dedicated resources, စွမ်းဆောင်ရည်မြင့်မားမှု |
| အရေးကြီးသော app များ | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### Configuration ဥပမာများ

**ဖွံ့ဖြိုးရေး**
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

**ထုတ်လုပ်မှု**
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
   - **Basic**: 5 DTU - ဖွံ့ဖြိုးရေး/စမ်းသပ်မှု
   - **Standard**: S0-S12 (10-3000 DTU) - General purpose
   - **Premium**: P1-P15 (125-4000 DTU) - စွမ်းဆောင်ရည်အရေးကြီး

2. **vCore-based** (ထုတ်လုပ်မှုအတွက်အကြံပြု)
   - **General Purpose**: Compute နှင့် storage အချိုးညီ
   - **Business Critical**: Latency နည်း၊ IOPS မြင့်
   - **Hyperscale**: Storage အလွန်ချဲ့နိုင်မှု (100TB အထိ)

#### ဥပမာ Configuration များ

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

#### အခြေအနေအမျိုးအစားများ

1. **Consumption-based**
   - သုံးသုံးလျှင်ပေး
   - ဖွံ့ဖြိုးရေးနှင့် variable workloads အတွက်သင့်လျော်
   - Shared infrastructure

2. **Dedicated (Workload Profiles)**
   - Dedicated compute resources
   - စွမ်းဆောင်ရည်အတိအကျ
   - ထုတ်လုပ်မှု workloads အတွက်ပိုမိုကောင်းမွန်

#### Configuration ဥပမာများ

**ဖွံ့ဖြိုးရေး (Consumption)**
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

**ထုတ်လုပ်မှု (Dedicated)**
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
   - စွမ်းဆောင်ရည်အတိအကျ
   - Reserved capacity လျော့စျေး
   - Steady workloads အတွက်အကောင်းဆုံး

2. **Autoscale Provisioned Throughput**
   - အသုံးပြုမှုအပေါ်အခြေခံ၍ အလိုအလျောက်ချဲ့
   - သုံးသုံးလျှင်ပေး (အနည်းဆုံးနှင့်အတူ)
   - Variable workloads အတွက်သင့်လျော်

3. **Serverless**
   - Request တစ်ခုချင်းစီအပေါ်အခြေခံ၍ပေး
   - Provisioned throughput မလိုအပ်
   - ဖွံ့ဖြိုးရေးနှင့် intermittent workloads အတွက်သင့်လျော်

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

1. **Standard_LRS** - ဖွံ့ဖြိုးရေး၊ အရေးမကြီးသောဒေတာ
2. **Standard_GRS** - ထုတ်လုပ်မှု၊ geo-redundancy လိုအပ်
3. **Premium_LRS** - စွမ်းဆောင်ရည်မြင့်မားသော application များ
4. **Premium_ZRS** - Zone redundancy ဖြင့်ရရှိနိုင်မှုမြင့်မားမှု

#### စွမ်းဆောင်ရည်အဆင့်များ

- **Standard**: General purpose, ကုန်ကျစရိတ်သက်သာမှု
- **Premium**: စွမ်းဆောင်ရည်မြင့်မားမှု၊ latency နည်းသောအခြေအနေများ

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

## ကုန်ကျစရိတ်သက်သာမှုနည်းဗျူဟာများ

### 1. Reserved Capacity

1-3 နှစ်အထိ resources ကို reserve လုပ်၍ လျော့စျေးရယူပါ:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

အသုံးပြုမှုအပေါ်အခြေခံ၍ သေးငယ်သော SKUs ဖြင့်စတင်ပြီး တိုးချဲ့ပါ:

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

စွမ်းဆောင်ရည်ကို optimize လုပ်ရန် intelligent scaling ကိုအသုံးပြုပါ:

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

## စွမ်းဆောင်ရည်စဉ်းစားမှုများ

### Baseline စွမ်းဆောင်ရည်လိုအပ်ချက်များ

SKU ရွေးချယ်မှုမပြုမီ စွမ်းဆောင်ရည်လိုအပ်ချက်များကိုရှင်းလင်းစွာသတ်မှတ်ပါ:

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

စွမ်းဆောင်ရည်ကိုအတည်ပြုရန် SKU များကိုစမ်းသပ်ပါ:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoring နှင့် Optimization

စုံလင်သော monitoring ကိုတည်ဆောက်ပါ:

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

## အမြန်ရည်ညွှန်းဇယားများ

### App Service SKU အမြန်ရည်ညွှန်း

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | ဖွံ့ဖြိုးရေး |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | အသေးစား app များ |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | ထုတ်လုပ်မှု |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | စွမ်းဆောင်ရည်မြင့်မားမှု |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | စီးပွားရေး |

### SQL Database SKU အမြန်ရည်ညွှန်း

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | ဖွံ့ဖြိုးရေး |
| S2 | Standard | 50 DTU | 250GB | $$ | အသေးစားထုတ်လုပ်မှု |
| P2 | Premium | 250 DTU | 1TB | $$$ | စွမ်းဆောင်ရည်မြင့်မားမှု |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | အချိုးညီ |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | အရေးကြီး |

### Container Apps SKU အမြန်ရည်ညွှန်း

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | ဖွံ့ဖြိုးရေး၊ variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | ထုတ်လုပ်မှု |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | စွမ်းဆောင်ရည်မြင့်မားမှု |

---

## အတည်ပြုမှု tools

### SKU ရရှိနိုင်မှု Checker

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

### ကုန်ကျစရိတ်ခန့်မှန်း Script

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

### စွမ်းဆောင်ရည်အတည်ပြုမှု

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

## အကောင်းဆုံးအလေ့အကျင့်များအကျဉ်းချုပ်

### လုပ်သင့်သောအရာများ

1. **အသေးငယ်သော SKUs ဖြင့်စတင်ပြီး** အသုံးပြုမှုအပေါ်အခြေခံ၍ တိုးချဲ့ပါ
2. **အခြေအနေအမျိုးအစားအလိုက် SKUs များကိုအသုံးပြုပါ**
3. **စွမ်းဆောင်ရည်နှင့်ကုန်ကျစ

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေပါသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါရှိနိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားယူမှားမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။