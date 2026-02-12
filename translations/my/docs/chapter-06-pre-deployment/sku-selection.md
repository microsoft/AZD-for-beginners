# SKU ရွေးချယ်ခြင်း လမ်းညွှန် - မှန်ကန်တဲ့ Azure ဝန်ဆောင်မှုပမာဏအဆင့်များ ရွေးချယ်ခြင်း

**အခန်း လမ်းကြောင်း:**
- **📚 သင်ကြားရေး کور့ အိမ်မျက်နှာ**: [AZD စတင်သူများအတွက်](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 6 - ကြိုတပ်ဆင်ခြင်းမပြုမီ အတည်ပြုနှင့် စီစဉ်ခြင်း
- **⬅️ ယခင်**: [စွမ်းဆောင်ရည် စီမံခြင်း](capacity-planning.md)
- **➡️ နောက်တမ်း**: [ကြိုတင်စစ်ဆေးမှုများ](preflight-checks.md)
- **🚀 နောက်တမ်း အခန်း**: [အခန်း 7: ပြဿနာရှာဖွေခြင်း](../chapter-07-troubleshooting/common-issues.md)

## မိတ်ဆက်

ဒီလမ်းညွှန်လုံးဝသည် သင်အား အပတ်စဉ်ပတ်လည်ပတ်ရောက်မှု၊ အလုပ်အမျိုးအစားနှင့် လိုအပ်ချက်များအရ အကောင်းဆုံး Azure ဝန်ဆောင်မှု SKU များကို ရွေးချယ်နိုင်ရန် အထောက်အကူပြုသည်။ ဆောင်ရွက်ချက်လိုအပ်ချက်များ၊ ကုန်ကျစရိတ် အချက်အလက်များ နှင့် တိုးချဲ့နိုင်မှု လိုအပ်ချက်များကို ခွဲခြမ်းစိတ်ဖြာပြီး Azure Developer CLI တင်သွင်းမှုများအတွက် သင့်တော်သော ဝန်ဆောင်မှု အဆင့်များကို ရွေးချယ်နည်းကို သင်ယူပါ။

## သင်ယူရန် ရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကို အပြီးသတ်လျှင် သင်သည်:
- Azure SKU အယူအဆများ၊ တာဝန်ချမှုစနစ်များနှင့် အင်္ဂါရပ်ကွာခြားချက်များကို နားလည်မည်
- ဖွံ့ဖြိုးရေး၊ စတေးဂျင်းနှင့် ထုတ်လုပ်မှု အလိုက် SKU ရွေးချယ်မှု မျက်နှာစာရင်း နည်းပညာများကို ကျွမ်းကျင်မည်
- အလုပ်တင်အတွက် လိုအပ်ချက်များအား ခွဲခြမ်း၍ သင့်တော်သော ဝန်ဆောင်မှုအဆင့်များနှင့် ကိုက်ညီစေရန် တိုက်ဆိုင်နိုင်မည်
- သိပ္ပံနည်းကျ SKU ရွေးချယ်မှုမှတဆင့် ကုန်ကျစရိတ် သက်သာစေရန် နည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်မည်
- SKU ရွေးချယ်မှုများအတွက် ဖျော်ဖြေရေး စမ်းသပ်မှုများနှင့် အတည်ပြုနည်းများကို အသုံးပြုနိုင်မည်
- အလိုအလျောက် SKU အကြံပြုချက်များနှင့် စောင့်ကြည့်ရေးကို ဖွင့်လှစ်ထိန်းသိမ်းနိုင်မည်

## သင်ယူပြီးရလဒ်များ

ပြီးမြောက်ချိန်တွင် သင်သည်:
- အလုပ်တင်လိုအပ်ချက်များနှင့် ကန့်သတ်ချက်များအပေါ် အခြေခံ၍ သင့်တော်သော Azure ဝန်ဆောင်မှု SKU များကို ရွေးချယ်နိုင်မည်
- သင့်တော်သော အဆင့်ရွေးချယ်ခြင်းဖြင့် ကုန်ကျစရိတ် ထိရောက်သော ပိုမိုမီလ်ပတ် ဝန်ဆောင်မှု ဖွဲ့စည်းပုံများကို ဒီဇိုင်းဆွဲနိုင်မည်
- SKU ရွေးချယ်မှုများအတွက် စွမ်းဆောင်ရည် သတ်မှတ်ချက် စမ်းသပ်ခြင်းနှင့် အတည်ပြုစနစ်များကို အကောင်အထည်ဖော်နိုင်မည်
- SKU အကြံပြုချက်နှင့် ကုန်ကျစရိတ် တိုးတက်အောင် ပြုလုပ်နိုင်သည့် အလိုအလျောက် ကိရိယာများကို ဖန်တီးနိုင်မည်
- ပြောင်းလဲနေသော လိုအပ်ချက်များအတွက် SKU လွှဲပြောင်းခြင်းနှင့် တိုးချဲ့မှု မဟာဗျူဟာများကို စီစဉ်နိုင်မည်
- ဝန်ဆောင်မှုအဆင့်ရွေးချယ်ခြင်းတွင် Azure Well-Architected Framework သဘောတရားများကို သက်ဆိုင်သလို လျှောက်ထားနိုင်မည်

## အကြောင်းအရာ စာရင်း

- [SKU များကို နားလည်ခြင်း](../../../../docs/chapter-06-pre-deployment)
- [ပတ်ဝန်းကျင်အလိုက် ရွေးချယ်မှု](../../../../docs/chapter-06-pre-deployment)
- [ဝန်ဆောင်မှု အလိုက် လမ်းညွှန်ချက်များ](../../../../docs/chapter-06-pre-deployment)
- [ကုန်ကျစရိတ် ထိရောက်စေရေး မဟာဗျူဟ်များ](../../../../docs/chapter-06-pre-deployment)
- [စွမ်းဆောင်ရည် အကဲဖြတ်ချက်များ](../../../../docs/chapter-06-pre-deployment)
- [လျင်မြန် အမ်းသာပြဇယားများ](../../../../docs/chapter-06-pre-deployment)
- [အတည်ပြု ကိရိယာများ](../../../../docs/chapter-06-pre-deployment)

---

## SKU များကို နားလည်ခြင်း

### SKU ဆိုတာဘာလဲ?

SKU များ (Stock Keeping Units) သည် Azure အရင်းအမြစ်များအတွက် ဝန်ဆောင်မှုပမာဏနှင့် စွမ်းဆောင်ရည် အဆင့်များကို ကိုယ်စားပြုသည်။ တစ်ခုချင်းစီ၏ SKU သည် အမျိုးမျိုးသော အချက်အလက်များကို ပေးသည် -

- **စွမ်းဆောင်ရည် ဆိုင်ရာ အင်္ဂါရပ်များ** (CPU, memory, throughput)
- **အင်္ဂါရပ် ရရှိနိုင်မှု** (scaling ရွေးချယ်စရာများ၊ SLA အဆင့်များ)
- **စျေးနှုန်း မော်ဒယ်များ** (သုံးစွဲမှုအပေါ်အခြေခံ၊ ရောက်ရှိခွင့် ပြဇာတ်)
- **ဒေသအလိုက် ရရှိနိုင်မှု** (အားလုံးဒေသများတွင် SKU များ မရှိနိုင်ပါ)

### SKU ရွေးချယ်မှုတွင် အဓိက အချက်များ

1. **အလုပ်တင်လွှာလိုအပ်ချက်များ**
   - မျှော်မှန်းထားသော traffic/လိုက်နာမှု ပုံစံများ
   - စွမ်းဆောင်ရည် လိုအပ်ချက်များ (CPU, memory, I/O)
   - သိုလှောင်မှု လိုအပ်ချက်များနှင့် access ပုံစံများ

2. **ပတ်ဝန်းကျင် အမျိုးအစား**
   - ဖွံ့ဖြိုးရေး/စမ်းသပ်မှု နှင့် ထုတ်လုပ်မှု
   - ရရှိနိုင်မှု လိုအပ်ချက်များ
   - လုံခြုံရေးနှင့်လိုက်နာမှုလိုအပ်ချက်များ

3. **ဘတ်ဂျက် ကန့်သတ်ချက်များ**
   - အစပြုကုန်ကျစရိတ်နှင့် စဉ်ဆက်မပြတ် ယာဖြတ်ကုန်ကျစရိတ်
   - reserved capacity အထူးလျော့စျေးများ
   - auto-scaling ၏ ကုန်ကျစရိတ် သက်ရောက်မှုများ

4. **တိုးတက်မှု ခန့်မှန်းချက်များ**
   - တိုးချဲ့နိုင်မှု လိုအပ်ချက်များ
   - အနာဂတ် အင်္ဂါရပ် လိုအပ်ချက်များ
   - လွှဲပြောင်းမှု ကိန်းခွာရှင်းမှု

---

## ပတ်ဝန်းကျင် အလိုက် ရွေးချယ်မှု

### ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်

**ဥပဒေကျစရာ အချက်အလက်များ**: ကုန်ကျစရိတ် သိသိသာသာ လျော့ချခြင်း၊ အခြေခံ လုပ်ဆောင်ချက်များ၊ ပေါ့ပါးစွာ provision/ de-provision ပြုလုပ်နိုင်ခြင်း

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

#### အင်္ဂါရပ်များ
- **App Service**: F1 (Free) သို့မဟုတ် B1 (Basic) ကို စမ်းသပ်မှုများအတွက် အသုံးပြုရန် သင့်တော်သည်
- **ဒေတာဘေ့စ်များ**: အနည်းဆုံး အရင်းအမြစ်များနှင့် Basic အဆင့်
- **သိုလှောင်မှု**: Standard (local redundancy) သာရှိသော အမျိုးအစား
- **Compute**: ပူးတွဲ ရင်းမြစ်များ အသုံးပြုနိုင်သည်
- **ကွန်ယက်**: အခြေခံ ဖော်ပြချက်များ

### Staging/စမ်းသပ် ပတ်ဝန်းကျင်

**ဥပဒေကျစရာ အချက်အလက်များ**: ထုတ်လုပ်မှုနှင့် နီးစပ်သော ဖော်မြူလာ၊ ကုန်ကျစရိတ်နှင့် သာတိမ်းကျမှု ညီမျှမှု၊ စွမ်းဆောင်ရည် စမ်းသပ်နိုင်မှု

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

#### အင်္ဂါရပ်များ
- **စွမ်းဆောင်ရည်**: ထုတ်လုပ်မှု စွမ်းရည်၏ 70-80%
- **အင်္ဂါရပ်များ**: ထုတ်လုပ်မှုအတွက် ရရှိနိုင်သည့် အင်္ဂါရပ်အများစု ဖွင့်ထားသည်
- ** redundancy **: ဒေသအချို့တွင် ပြန်လည်ထပ်တူရှိမှု
- **Scaling**: စမ်းသပ်မှုအတွက် အကန့်အသတ် auto-scaling
- **စောင့်ကြည့်ရေး**: အပြည့်အစုံ မော်နီတောက် စနစ်

### ထုတ်လုပ်မှု ပတ်ဝန်းကျင်

**ဥပဒေကျစရာ အချက်အလက်များ**: စွမ်းဆောင်ရည်၊ ရရှိနိုင်မှု၊ လုံခြုံရေး၊ လိုက်နာမှု၊ တိုးချဲ့နိုင်မှု

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

#### အင်္ဂါရပ်များ
- **အမြင့်ဆုံး ရရှိနိုင်မှု**: 99.9%+ SLA လိုအပ်ချက်များ
- **စွမ်းဆောင်ရည်**: သီးသန့် ရင်းမြစ်များ၊ အမြင့်ထိ throughput
- **လုံခြုံရေး**: ပရီးမြီယံ လုံခြုံရေး အင်္ဂါရပ်များ
- **တိုးချဲ့မှု**: အပြည့်အစုံ auto-scaling ဖောင်ရှင်များ
- **စောင့်ကြည့်ရေး**: စုံလင်သော observability

---

## ဝန်ဆောင်မှု အလိုက် လမ်းညွှန်ချက်များ

### Azure App Service

#### SKU ဆုံးဖြတ်ချက် ဇယား

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | စမ်းသပ်ရန် သက်သာသော ကုန်ကျစရိတ်၊ လုံလောက်သည် |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | ပိုမိုကောင်းမွန်သော စွမ်းဆောင်ရည်၊ အင်္ဂါရပ်များပိုများသည် |
| High-traffic apps | P2V3 or P3V3 | သီးသန့် ရင်းမြစ်များ၊ အမြင့်စွမ်းဆောင်ရည် |
| Mission-critical apps | I1V2 (Isolated V2) | ကွန်ယက် သီးသန့်မှု၊ သီးသန့် ဟာ့ဒ်ဝဲ |

#### ပြင်ဆင်မှု ဥပမာများ

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

#### SKU ရွေးချယ်မှု ဖွဲ့စည်းပုံ

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - ဖွံ့ဖြိုးရေး/စမ်းသပ်မှု
   - **Standard**: S0-S12 (10-3000 DTU) - အထွေထွေ အသုံးပြုနိုင်မှု
   - **Premium**: P1-P15 (125-4000 DTU) - စွမ်းဆောင်ရည် အရေးကြီးသော အလုပ်အတွက်

2. **vCore-based** (ထုတ်လုပ်မှုအတွက် အကြံပြု)
   - **General Purpose**: compute နှင့် storage ကို သာလျှင် မျှတစွာ ပေးသည်
   - **Business Critical**: အနည်းဆုံး latency၊ အမြင့် IOPS
   - **Hyperscale**: အလွန်တိုးချဲ့နိုင်သော သိုလှောင်မှု (အထိ 100TB)

#### ဥပမာ ဖော်ပြချက်များ

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

#### ပတ်ဝန်းကျင် အမျိုးအစားများ

1. **Consumption-based**
   - အသုံးအပေါ် အစွန်းပေးငွေပေးစနစ်
   - ဖွံ့ဖြိုးရေးနှင့် လိုအပ်ချက် မတည်ငြိမ်သော အလုပ်များအတွက် သင့်တော်သည်
   - ပူးတွဲ လုပ်ငန်းဖွဲ့စည်းမှု

2. **Dedicated (Workload Profiles)**
   - သီးသန့် compute ရင်းမြစ်များ
   - စွမ်းဆောင်ရည် အစဉ်အဆက် မပြတ်တည်ရှိမှု
   - ထုတ်လုပ်မှု အလုပ်များအတွက် မပိုကောင်း

#### ပြင်ဆင်မှု ဥပမာများ

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

#### Throughput မော်ဒယ်များ

1. **Manual Provisioned Throughput**
   - သတ်မှတ်နိုင်သော စွမ်းဆောင်ရည်
   - ရောက်ရှိခွင့် လျော့စျေးများ
   - တည်ငြိမ်သော အလုပ်များအတွက် အကောင်းဆုံး

2. **Autoscale Provisioned Throughput**
   - အသုံးအပေါ် အလိုအလျောက် တိုးချဲ့မှု
   - သုံးစွဲသည်အတိုင်း ပေးဆောင် (နည်းနည်း အနိမ့်ရှိသည်)
   - မတည်ငြိမ်သော အလုပ်များအတွက် သင့်တော်သည်

3. **Serverless**
   - တောင်းဆိုမှုအပေါ် အစွမ်းအတွက် ပေးဆောင်သည်
   - provisioned throughput မရှိ
   - ဖွံ့ဖြိုးရေးနှင့် အခါအားလျော်စွာ အလုပ်များအတွက် အထူးသင့်တော်သည်

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

1. **Standard_LRS** - ဖွံ့ဖြိုးရေး၊ အရေးကြီးမဟုတ်သော ဒေတာများ
2. **Standard_GRS** - ထုတ်လုပ်မှု၊ ဒေသတစ်ပါး ပြန်လည်ထပ်တူရှိမှု လိုအပ်သောအခါ
3. **Premium_LRS** - အမြင့်စွမ်းဆောင်ရည် အသုံးချမှုများ
4. **Premium_ZRS** - ဇုန် ပြန်လည်ထပ်တူရှိမှုဖြင့် အမြင့် ရရှိနိုင်မှု

#### စွမ်းဆောင်ရည် အဆင့်များ

- **Standard**: အထွေထွေ အသုံးပြုရန်၊ ကုန်ကျစရိတ် သက်သာ
- **Premium**: အမြင့်စွမ်းဆောင်ရည်၊ နည်း latency လိုအပ်ချက်များ

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

## ကုန်ကျစရိတ် ထိရောက်စေရေး မဟာဗျူဟ်များ

### 1. Reserved Capacity

1-3 နှစ် ကြာအောင် ရင်းမြစ်များကို ကြိုချထား၍ အကြီးစား လျော့စျေးရနိုင်သည်။

```bash
# ကြိုတင်မှာယူရန် ရွေးချယ်စရာများကို စစ်ဆေးပါ
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

စတင်သည့်အခါ သေးငယ်သော SKUs များဖြင့် စ၍ အမှန်တမ်း အသုံးပြုမှုအပေါ် မူတည်၍ တိုးမြှင့်ပါ။

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

### 3. Auto-Scaling ပြင်ဆင်ချက်များ

ကုန်ကျစရိတ် ထိရောက်စေရန် ထိထိရောက်ရောက် scaling မဟာဗျူဟ်များကို တက်ထွင်ပါ။

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

### 4. Timed/Sheduled Scaling

အလုပ်နေပရီ မဟုတ်သည့် အချိန်များတွင် အတိုင်းအတာ လျော့ချပါ။

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

## စွမ်းဆောင်ရည် စဉ်းချက်များ

### အခြေခံ စွမ်းဆောင်ရည် လိုအပ်ချက်များ

SKU ရွေးချယ်ရန်မတိုင်မီ အသေအချာ စွမ်းဆောင်ရည် လိုအပ်ချက်များကို သတ်မှတ်ပါ။

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

အမျိုးမျိုးသော SKU များကို စမ်းသပ်၍ စွမ်းဆောင်ရည်ကို အတည်ပြုပါ။

```bash
# Azure Load Testing ဝန်ဆောင်မှု
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### စောင့်ကြည့်ရေးနှင့် အားသာချက် အမြှင့်တင်မှု

စုံလင်သော စောင့်ကြည့်ရေးစနစ် တပ်ဆင်ပါ။

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

## လျင်မြန် အမ်းသာ ပြဇယားများ

### App Service SKU လျင်မြန် အမ်းသာ

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | ဖွံ့ဖြိုးရေး |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | အသေးစား အက်ပ်များ |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | ထုတ်လုပ်မှု |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | အမြင့်စွမ်းဆောင်ရည် |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | စီးပွားရေး အဖွဲ့အစည်းများ |

### SQL Database SKU လျင်မြန် အမ်းသာ

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | ဖွံ့ဖြိုးရေး |
| S2 | Standard | 50 DTU | 250GB | $$ | အသေးစား ထုတ်လုပ်မှု |
| P2 | Premium | 250 DTU | 1TB | $$$ | အမြင့်စွမ်းဆောင်ရည် |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | ညီမျှသော သုံးစွဲမှု |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | အရေးပါ စေလာငြင်းများ |

### Container Apps SKU လျင်မြန် အမ်းသာ

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | ဖွံ့ဖြိုးရေး၊ မတည်ငြိမ်သော လုပ်ငန်း |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | ထုတ်လုပ်မှု |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | အမြင့်စွမ်းဆောင်ရည် |

---

## အတည်ပြု ကိရိယာများ

### SKU ရရှိနိုင်မှု စစ်ဆေးသူ

```bash
#!/bin/bash
# ကုန်ပစ္စည်းကုဒ် (SKU) ကို ပစ်မှတ်ဒေသတွင် ရရှိနိုင်မှုကို စစ်ဆေးပါ

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

# အသုံးပြုပုံ
check_sku_availability "eastus" "app-service" "P1V3"
```

### ကုန်ကျစရိတ် ခန့်မှန်းရေး စကရိပ်

```powershell
# PowerShell စကရစ်ဖြင့် ကုန်ကျစရိတ် ခန့်မှန်းခြင်း
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
        
        # Azure Pricing API သို့မဟုတ် တွက်ချက်စက်ကို အသုံးပြုပါ
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# အသုံးပြုနည်း
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### စွမ်းဆောင်ရည် အတည်ပြုခြင်း

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

## အကောင်းဆုံး လေ့လာချက် တိုထွာစာ

### ပြုလုပ်သင့်သောများ

1. **စတင်သည့်အခါ သေးငယ်စွာ စ၍ တိုးထွားပါ** - အမှန်တမ်း အသုံးပြုမှုအပေါ် အခြေခံ၍ တိုးမြှင့်ပါ
2. **ပတ်ဝန်းကျင် များအလိုက် ထူးခြားသော SKUs အသုံးပြုပါ**
3. **စွမ်းဆောင်ရည်နှင့် ကုန်ကျစရိတ်ကို ဆက်လက် စောင့်ကြည့်ပါ**
4. **ထုတ်လုပ်မှု အလုပ်များအတွက် reserved capacity ကို အသုံးချပါ**
5. **သင့်တော်ပါက auto-scaling ကို အကောင်အထည်ဖော်ပါ**
6. **ရင်ဆိုင်ဖောက်ထွင်းစမ်းသပ်မှုများနှင့် performance စမ်းသပ်ပါ**
7. **တိုးတက်မှု အတွက် စီစဉ်ပါ၊ သို့သော် over-provisioning မလုပ်ပါ**
8. **ဖွံ့ဖြိုးရေးအတွက် အခမဲ့ အဆင့်များကို အသုံးချရန် ကြိုးစားပါ**

### မလုပ်သင့်သောများ

1. **ဖွံ့ဖြိုးရေး အတွက် ထုတ်လုပ်မှု SKUs မသုံးပါနဲ့**
2. **ဒေသအလိုက် SKU ရရှိနိုင်မှုကို မမေ့ပါနဲ့**
3. **ဒေတာ ပို့ဆောင်ခြင်း ကုန်ကျစရိတ်ကို မမေ့ပါနဲ့**
4. **အတည်ပြုချက်မရှိဘဲ over-provisioning မလုပ်ပါနဲ့**
5. **အခြား အပေါ် ပေါက်ကရ အကျိုးသက်ရောက်မှုကို မမေ့ပါနဲ့**
6. **auto-scaling နေရာချထားမှုများကို အလွန်မြင့်မားစွာ မထားပါနဲ့**
7. **လိုက်နာမှုလိုအပ်ချက်များကို မမေ့ပါနဲ့**
8. **စျေးနှုန်းပေါ်အပေါ် မူတည်ပြီး ဆုံးဖြတ်ချက် မလုပ်ပါနဲ့**

---

**အထူး အကြံပြုချက်**: Azure Cost Management နှင့် Advisor များကို အသုံးပြု၍ သင်၏ အမှန်တမ်း အသုံးပြုမှု ပုံစံများအပေါ် အခြေခံပြီး SKU ရွေးချယ်မှုများကို ထိရောက်စွာ တိုးတက်အောင် အကြံပြုချက်များ ရယူပါ။

---

**လမ်းကြောင်း**
- **ယခင် သင်ခန်းစာ**: [စွမ်းဆောင်ရည် စီမံခြင်း](capacity-planning.md)
- **နောက်တမ်း သင်ခန်းစာ**: [ကြိုတင်စစ်ဆေးမှုများ](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှုဖြစ်သော [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် အမြဲကြိုးပမ်းပါသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့်သာ တရားဝင် အရင်းအမြစ်အဖြစ် သတ်မှတ်စဉ်းစားသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန် ပညာရှင်မှ တိုက်ရိုက် ဘာသာပြန်ချက် ရယူရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကနေ ဖွဲ့စည်းလာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် သို့မဟုတ် မှားယွင်းစွာ ဉာဏ်ပေါ်လာစေသည့် အဓိပ္ပာယ်ဖော်ပြချက်များအတွက် ကျွန်ုပ်တို့သည် တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->