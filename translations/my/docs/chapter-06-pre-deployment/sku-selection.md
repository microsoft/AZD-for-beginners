# SKU ရွေးချယ်မှု လမ်းညွှန်ချက် - သင့်တော်သော Azure Service Tiers ရွေးချယ်ခြင်း

**အတန်းမှာ စောင့်ကြည့်ခြင်း:**
- **📚 သင်တန်းအစ အိမ်**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအတန်း**: အခန်း ၆ - အတွေ့အကြုံမတင်မီ စစ်ဆေးရေးနှင့် စီမံကိန်းရေးဆွဲခြင်း
- **⬅️ ယခင်အခန်း**: [စွမ်းဆောင်ရည် စီမံကိန်းရေးဆွဲခြင်း](capacity-planning.md)
- **➡️ နောက်အခန်း**: [ပျံ့နှံ့ရန် စစ်ဆေးမှုများ](preflight-checks.md)
- **🚀 နောက်တစ်ခု အခန်း**: [အခန်း ၇: ပြဿနာရှာဖွေခြင်း](../chapter-07-troubleshooting/common-issues.md)

## နိဒါန်း

ဒီလမ်းညွှန်ချက်မှာ သင့် Azure Developer CLI ဖြင့် မတူညီသော ပတ်ဝန်းကျင်များ၊ လုပ်ငန်းတာဝန်များနှင့် လိုအပ်ချက်များအတွက် အကောင်းဆုံး Azure ဝန်ဆောင်မူ SKU များကို ရွေးချယ်ရန် ကူညီပေးပါသည်။ စွမ်းဆောင်ရည်လိုအပ်ချက်များ၊ ကုန်ကျစရိတ် ဆင်ခြေလှမ်းများ၊ နှင့် တိုးချဲ့နိုင်မှုလိုအပ်ချက်များကို စိစစ်ပြီး သင့်တော်သော ဝန်ဆောင်မှုအဆင့်များကို ရွေးချယ်နိုင်ပါမည်။

## သင်ယူမှု ရည်မှန်းချက်များ

ဒီလမ်းညွှန်ချက်ကို ပြီးမြောက်စွာ လေ့လာပြီးနောက် သင်သည်
- Azure SKU အခြေခံသဘော၊ စျေးနှုန်းပုံစံများနှင့် လုပ်ဆောင်ချက်နားလည်မှု ရရှိမည်
- ဖွံ့ဖြိုးရေး၊ စမ်းသပ်ခန်း၊ ထုတ်လုပ်မှု စတဲ့ ပတ်ဝန်းကျင်အလိုက် SKU ရွေးချယ်နည်းများကို ကျွမ်းကျင်ထိန်းသိမ်းမည်
- လုပ်ငန်းတာဝန်လိုအပ်ချက်များ ခွဲခြမ်းစိတ်ဖြာ၍ သင့်တော်သော ဝန်ဆောင်မှုအဆင့်များနှင့် ကိုက်ညီစွာ ရွေးချယ်မည်
- ဉာဏ်ရည်ပေါ်တည်ပြီး SKU ရွေးချယ်မှုဖြင့် ကုန်ကျစရိတ် ထိရောက်စွာ စီမံပုံဆွဲမည်
- SKU ရွေးခြင်းအတွက် စွမ်းဆောင်ရည် စမ်းသပ်ခြင်းနှင့် အတည်ပြု နည်းလမ်းများ အသုံးပြုမည်
- အလိုအလျောက် SKU အကြံပြုချက်များနှင့် စောင့်ကြည့်မှုများ ကို ဖန်တီးပါမည်

## သင်ယူ ပြီးမြောက်ခြင်း အကျိုးကျေးဇူးများ

ပြီးမြောက်ပြီးနောက် သင့်အား အောက်ပါစွမ်းရည်များရှိမည်ဖြစ်သည်-
- လုပ်ငန်းတာဝန်လိုအပ်ချက်နှင့် ကန့်သတ်ချက်များအရ သင့်တော်သော Azure ဝန်ဆောင်မှု SKU ကို ရွေးချယ်နိုင်ခြင်း
- ကုန်ကျစရိတ်သက်သာစေရေးနှင့် မျိုးစုံပတ်ဝန်းကျင်များအတွက် သင့်တော်သော အဆင့်များနှင့်အတူ ပုံစံရေးဆွဲနိုင်ခြင်း
- SKU ရွေးချယ်မှုအတွက် စွမ်းဆောင်ရည် စမ်းသပ်မှုနှင့် အတည်ပြုခြင်း ကိုအသုံးပြုနိုင်ခြင်း
- SKU အကြံပြုမှုနှင့် ကုန်ကျစရိတ် ဖြတ်တောက်မှု အလိုအလျောက်ကိရိယာများ ဖန်တီးနိုင်ခြင်း
- လိုအပ်ချက်ပြောင်းလဲမှုများအတွက် SKU ရွှေ့ပြောင်းမှုနှင့် တိုးချဲ့မှု မဟာဗျူဟာများ အစီအစဉ်ဆွဲနိုင်ခြင်း
- Azure Well-Architected Framework သဘောတရားများကို ဝန်ဆောင်မှုအဆင့် ရွေးချယ်မှုတွင် လိုအပ်သလို ပြုပြင် အသုံးချနိုင်ခြင်း

## အကြောင်းအရာ စာရင်း

- [SKU များ နားလည်ခြင်း](#understanding-skus)
- [ပတ်ဝန်းကျင်အလိုက် ရွေးချယ်ခြင်း](#environment-based-selection)
- [ဝန်ဆောင်မှု အထူးလမ်းညွှန်ချက်များ](#service-specific-guidelines)
- [ကုန်ကျစရိတ် ထိရောက်မှုနည်းလမ်းများ](#cost-optimization-strategies)
- [စွမ်းဆောင်ရည် စဉ်းစားချက်များ](#performance-considerations)
- [အမြန် ရည်ညွှန်း စာတမ်းများ](#quick-reference-tables)
- [အတည်ပြု ကိရိယာများ](#validation-tools)

---

## SKU များနားလည်ခြင်း

> **ဥပမာ အကွာအဝေး:** ရှေ့တင်ထားသော YAML SKU မြေပုံများနှင့် စွမ်းဆောင်ရည် ဖွဲ့စည်းချက်များမှာ ဒီဇိုင်းမှတ်စုများဖြစ်ပြီး `azure.yaml` schema သို့မဟုတ် load-tool ဖန်တီးမှု မဟုတ်ပါ။ Bicep blocks သည် အခြားရွေးချယ်စရာ/တစိတ်တပိုင်းဖြစ်ပြီး- ၎င်းတို့၏အပိုင်းများနှင့် မိဘရင်းမြစ်များကို ကြေညာပြီး တွဲဖက်အသုံးပြုရန် အမှတ်အသားများကို ထူးခြားစွာအသုံးပြု၍ မော်ဂျူးများကို လုပ်ငန်းစဉ်တစ်ခု သို့ ချိတ်ဆက်ရန်ဖြစ်သည်။ စျေးနှုန်းများ၊ ကန့်သတ်ချက်များ နှင့် ဒေသ/ SKU ရရှိနိုင်မှုကို သင့်စာရင်းစစ်မှု စတင်မတိုင်မီ စစ်ဆေးရန် လိုအပ်ပါသည်။

### SKU များဆိုသည်မှာ ဘာလဲ?

SKU များ (Stock Keeping Units) သည် Azure အရင်းအမြစ်များအတွက် မတူညီသော ဝန်ဆောင်မှုအဆင့်များနှင့် စွမ်းဆောင်ရည် နာနတ်များကို ကိုယ်စားပြုသည်။ တစ်ခုချင်းစီသည် အောက်ပါများကို ပေးသည်-

- **စွမ်းဆောင်ရည် အင်္ဂါရပ်များ** (CPU, မေမရီ, throughput)
- **လက္ခဏာရရှိမှု** (တိုးချဲ့ခြင်းရွေးချယ်စရာများ, SLA အဆင့်များ)
- **စျေးနှုန်းပုံစံများ** (စားသုံးမှုအခြေခံ, ရွှေ့ခွင့်ပမာဏသိမ်းဆည်းမှု)
- **ဒေသဆိုင်ရာ ရရှိနိုင်မှု** (SKUs အားလုံး မရရှိနိုင်သည့် ဒေသများရှိနိုင်ပါသည်)

### SKU ရွေးချယ်ရာတွင် အဓိကအချက်များ

၁။ **လုပ်ငန်းတာဝန် လိုအပ်ချက်များ**
   - မျှော်မှန်းထားသော traffic/load ပုံစံများ
   - စွမ်းဆောင်ရည်လိုအပ်ချက်များ (CPU, မေမရီ, I/O)
   - သိမ်းဆည်းမှု လိုအပ်ချက်များနှင့် မိတ္တူရယူပုံများ

၂။ **ပတ်ဝန်းကျင် အမျိုးအစား**
   - ဖွံ့ဖြိုးရေး/စမ်းသပ်မှု ဂရုတစ်ထဲ သုံး vs ထုတ်လုပ်မှု
   - ရရှိနိုင်မှု လိုအပ်ချက်များ
   - လုံခြုံရေး နှင့် စည်းမျဉ်းစည်းကမ်းလိုအပ်ချက်များ

၃။ **ဘတ်ဂျက် ကန့်သတ်ချက်များ**
   - စတင်ต้นကျစရိတ် နှင့် လည်ပတ်မှု ကုန်ကျစရိတ်များ
   - သိမ်းဆည်းမှုလျော့စျေးများ
   - အလိုအလျောက်နှုန်းချုပ်မှု ကုန်ကျစရိတ်

၄။ **တိုးတက်မှုခန့်မှန်းချက်များ**
   - တိုးချဲ့နိုင်မှုလိုအပ်ချက်များ
   - နောင်လာ လိုအပ်ချက်များ
   - ရွှေ့ပြောင်းခြင်း ဖွဲ့စည်းမှု

---

## ပတ်ဝန်းကျင်အလိုက် ရွေးချယ်ခြင်း

### ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်

** ဦးစားထားမှုများ **: ကုန်ကျစရိတ် ထိရောက်မှု, အခြေခံ လုပ်ဆောင်ချက်များ, ပရိုဗိုင်းဒင်း/ဖြုတ်ခြင်း လွယ်ကူမှု

#### အကြံပြု SKU များ
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

#### လက္ခဏာများ
- **App Service**: ရိုးရှင်းသော စမ်းသပ်မှုအတွက် F1 (အခမဲ့) သို့မဟုတ် B1 (အခြေခံ)
- **ဒေတာဘေ့စ်များ**: အနည်းဆုံး အရင်းအမြစ်များအားဖြင့် အခြေခံအဆင့်
- **သိုလှောင်မှု**: ဒေသအလိုက် တူညီမှုရှိသော စံပိုင်း
- **ကွန်ပျူတာ**: အသုံးပြုသူငှားရမ်းမှု လက်ခံနိုင်သည်
- **ကွန်ရက်**: အခြေခံ ဖွဲ့စည်းမှုများ

### စတိတ်/စမ်းသပ်မှု ပတ်ဝန်းကျင်

** ဦးစားထားမှုများ **: ထုတ်လုပ်မှုနှုန်းထားနီးပါး ပုံစံ, ကုန်ကျစရိတ်ချိန်ညှိမှု, စွမ်းဆောင်ရည် စမ်းသပ်မှုအားဖြင့် အသုံးပြုနိုင်မှု

#### အကြံပြု SKU များ
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
- **စွမ်းဆောင်ရည်**: ထုတ်လုပ်မှုစွမ်းရည်၏ ၇၀-၈၀%
- **ဖွဲ့စည်းမှုများ**: ထုတ်လုပ်မှု ဖွဲ့စည်းမှုများ အများစု ပါဝင်သည်
- **တူညီမှု**: ဒေသတချို့တွင် တူညီမှုရှိသည်
- **တိုးချဲ့မှု**: စမ်းသပ်မှုအတွက် အလိုအလျောက်တိုးချဲ့မှု ကန့်သတ်ထားသည်
- **စောင့်ကြည့်မှု**: အပြည့်အစုံ စောင့်ကြည့်မှုတန်းဖွဲ့

### ထုတ်လုပ်မှု ပတ်ဝန်းကျင်

** ဦးစားထားမှုများ **: စွမ်းဆောင်ရည်, ရရှိနိုင်မှု, လုံခြုံမှု, စည်းကမ်းချုပ်မှု, တိုးချဲ့နိုင်မှု

#### အကြံပြု SKU များ
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

#### လက္ခဏာများ
- **မြင့်မားသော ရရှိနိုင်မှု**: ၉၉.၉%+ SLA လိုအပ်ချက်များ
- **စွမ်းဆောင်ရည်**: သီးသန့်အရင်းအမြစ်များ၊ မြင့်မားသော throughput
- **လုံခြုံရေး**: အဆင့်မြင့် အာမခံချက်များ
- **တိုးချဲ့မှု**: အပြည့်အစုံ အလိုအလျောက် တိုးချဲ့မှု
- **စောင့်ကြည့်မှု**: သေချာသော ကြည့်ရှုစောင့်ကြည့်မှု

---

## ဝန်ဆောင်မှုအထူး လမ်းညွှန်ချက်များ

### Azure App Service

#### SKU သတ်မှတ်ခြင်း မျက်နှာပြင်

| အသုံးပြုမှုအမှု | အကြံပြု SKU | အကြောင်းပြချက် |
|----------|----------------|-----------|
| ဖွံ့ဖြိုးရေး/စမ်းသပ်မှု | F1 (အခမဲ့) သို့မဟုတ် B1 (အခြေခံ) | ကုန်ကျစရိတ် သက်သာပြီး စမ်းသပ်ရန်လုံးလုံး |
| သေးငယ်သော ထုတ်လုပ်မှုအက်ပ် | S1 (စံပြ) | မိမိသားညီ . domainများ, SSL, auto-scaling ပါဝင်သည် |
| အလတ်စား ထုတ်လုပ်မှုအက်ပ် | P1V3 (Premium V3) | ပိုမိုကောင်းမွန်သော စွမ်းဆောင်ရည်, လက္ခဏာပိုများ |
| မြင့်မားသော traffic အက်ပ်များ | P2V3 သို့မဟုတ် P3V3 | သီးသန့် အရင်းအမြစ်များ၊ လျင်မြန်သော စွမ်းဆောင်ရည် |
| အရေးကြီးသော အက်ပ်များ | I1V2 (သီးခြား V2) | ကွန်ယက်ထိန်းသိမ်းမှု၊ သီးသန့် hardware |

#### ဖွဲ့စည်းမှု ဥပမာများ

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

#### SKU ရွေးချယ်မှု ဖွဲ့စည်းမှု

၁။ **DTU-အခြေခံ** (Database Transaction Units)
   - **အခြေခံ**: ၅ DTU - ဖွံ့ဖြိုးရေး/စမ်းသပ်မှု
   - **စံချိန်**: S0-S12 (၁၀-၃၀၀၀ DTU) - အထွေထွေသုံး
   - **နှစ်ဆက်**: P1-P15 (၁၂၅-၄၀၀၀ DTU) - စွမ်းဆောင်ရည် အရေးပေါ်

၂။ **vCore-အခြေပြု** (ထုတ်လုပ်မှုအတွက် အကြံပြု)
   - **အထွေထွေ သုံး**: ကွန်ပျူတာနှင့် သိမ်းဆည်းမှု မြှင့်တင်မှု
   - **လက်ရှိ အရေးကြီး**: နိမ့်သော latency, မြင့်မားသော IOPS
   - **Hyperscale**: တိုးချဲ့နိုင်သော သိမ်းဆည်းမှု; လက်ရှိ အရွယ်အစား ကန့်သတ်ချက်များနှင့် ဒေသပါဝင်မှု စစ်ဆေးရန်

#### ဥပမာ ဖွဲ့စည်းမှုများ

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

၁။ **စားသုံးမှုအခြေခံ**
   - အသုံးအလိုက် စျေးနှုန်းပေးခြင်း
   - ဖွံ့ဖြိုးရေးနှင့် ပြောင်းလဲမှုရှိသော လုပ်ငန်းတွင် သင့်တော်သည်
   - ဝေငှရာ အခြေခံ အဆောက်အအုံ

၂။ **သီးသန့် (လုပ်ငန်းတာဝန် ပရိုဖိုင်းများ)**
   - အတွက် သီးသန့် ကွန်ပျူတာ အရင်းအမြစ်
   - ကြိုတင် ခန့်မှန်းနိုင်သော စွမ်းဆောင်ရည်
   - ထုတ်လုပ်မှု လုပ်ငန်းတာဝန်များအတွက် ပိုမိုသင့်တော်သည်

#### ဖွဲ့စည်းမှု ဥပမာများ

**ဖွံ့ဖြိုးရေး (စားသုံးမှု)**
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

**ထုတ်လုပ်မှု (သီးသန့်)**
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

ဘာသာရပ် တူညီမှုတွင် ဒေသထောက်ပံ့မှုရှိသော အဆောက်အအုံနှင့် သင့်တော်သော VNet/subnet ဖွဲ့စည်းမှု လိုအပ်၍ ဤနေရာတွင် မပါဝင်ပါ။ ဥပမာသည် သီးသန့် node သုံးခုအစီအစဉ်ဖြစ်ပြီး; နယ်တူဖြန့်ဖြူးမှုအတွက် အက်ပ်များ အနည်းဆုံး များနှစ်ခု ဖြစ်ရမည်နှင့် နယ်တစ်ခုမှင်မှုအတွက် အက်ပ်နှစ်ခုနှင့် node များ၏ အရွယ်အစားကို စီမံရမည်။ [Container Apps ယုံကြည်နိုင်မှု လမ်းညွှန်ချက်](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps) ကို ကြည့်ပါ။ အက်ပ်တစ်ခုအား ဒီပရိုဖိုင်းတွင်ထားလိုပါက ၎င်း၏ `workloadProfileName: 'production-profile'` ကို သတ်မှတ်ပါ; ပရိုဖိုင်းပုံစံတစ်ခု ဖန်တီးခြင်း သာဖြင့် အက်ပ်များသည် ဤပရိုဖိုင်းသို့ မရွှေ့မထားပါ။

### Azure Cosmos DB

#### Throughput ပုံစံများ

၁။ **လက်ရှိ ကြိုတင် သတ်မှတ်ထားသော Throughput**
   - ကြိုတင် ခန့်မှန်းနိုင်သော စွမ်းဆောင်ရည်
   - သိမ်းဆည်းမှုလျော့စျေးများ
   - တည်ငြိမ်သော လုပ်ငန်းတာဝန်များအတွက် အကောင်းဆုံး

၂။ **အလိုအလျောက် တိုးချဲ့သတ်မှတ် Throughput**
   - အသုံးပြုမှုအပေါ် အလိုအလျောက် တိုးချဲ့ခြင်း
   - သုံးစွဲသည့်အတိုင်း ပေးချေခြင်း (အနည်းဆုံးရှိသည်)
   - ပြောင်းလဲမှုရှိသော လုပ်ငန်းတာဝန်များအတွက် သင့်တော်သည်

၃။ **Serverless**
   - မေးခွန်းတစ်ခုချင်း စျေးချေခြင်း
   - ကြိုတင် သတ်မှတ် Throughput မရှိခြင်း
   - ဖွံ့ဖြိုးရေးနှင့် ကပ်လွန်လွတ်သော လုပ်ငန်းတာဝန်အတွက် သင့်တော်သည်

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

#### Storage အကောင့်အမျိုးအစားများ

၁။ **Standard_LRS** - ဖွံ့ဖြိုးရေး၊ အရေးပေါ်မဟုတ်သော ဒေတာများ
၂။ **Standard_GRS** - ထုတ်လုပ်မှု၊ ဒေသများအတွင်း တူညီမှု လိုအပ်သော
၃။ **Premium_LRS** - မြင့်မားသော စွမ်းဆောင်ရည် လိုအပ်သော အက်ပ်များ
၄။ **Premium_ZRS** - နယ်ပယ်တစ်ဝှမ်း ရှိမှုနှင့် နယ်တည်မှတ်၏ မြင့်မားသော ရရှိနိုင်မှု

#### စွမ်းဆောင်ရည် အဆင့်များ

- **Standard**: အထွေထွေသုံး, ကုန်ကျစရိတ် လျှော့ချထားသော
- **Premium**: မြင့်မားသော စွမ်းဆောင်ရည်, နိမ့် latency အခြေအနေများ

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

## ကုန်ကျစရိတ် ထိရောက်မှုနည်းလမ်းများ

### ၁။ သိမ်းဆည်းမှု စွမ်းအား ရွှေ့ခွင့်

၁-၃ နှစ်အတွင်း အရင်းအမြစ်များကို ကြိုတင် သိမ်းဆည်းခြင်းဖြင့် လျော့ပြီးသော စျေးနှုန်းများ ရရှိနိုင်သည်-

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

သိမ်းဆည်းမှု ရွေးချယ်မှုများနှင့် တစ်ခုချင်းသော ရင်းမြစ်အမျိုးအစားများကွာခြားနိုင်သည်; စာရင်းနှင့် ဝယ်ယူ ပုဂ္ဂိုလ်ရေးသတ်မှတ်ချက်များကို တိတိကျကျ ပြန်လည်စစ်ဆေးပါ၊ ဝန်ဆောင်မှု/SKU တစ်ခုချင်းစီသည် သိုလှောင်မှုကို ပံ့ပိုးခြင်း မရှိနိုင်ပါ။

### ၂။ မှန်ကန်သော အရွယ်အစား ရွေးချယ်ခြင်း

စကေးတက်သောစနစ်နှင့် တကယ်သုံးစွဲမှုအပေါ် အခြေခံပြီး ပိုငယ်သော SKU များနှင့် စတင်ပါ-

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

### ၃။ အလိုအလျောက်တိုးချဲ့မှု ဆက်တင်များ

ဉာဏ်ရည်ဖြင့် စကေးတက်မှု စနစ် ဖန်တီး၍ ကုန်ကျစရိတ် ထိရောက်စွာ စီမံပါ-

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

### ၄။ ချိန်ညှိထားသော တိုးချဲ့မှု

အလုပ်ချိန်မရှိသည့်အချိန် အတွင်း လျော့ချပါ-

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

## စွမ်းဆောင်ရည် စဉ်းစားချက်များ

### အခြေခံ စွမ်းဆောင်ရည် လိုအပ်ချက်များ

SKU ရွေးချယ်မီ စွမ်းဆောင်ရည် လှိုင်းရှင်းပြတ်သားစွာ သတ်မှတ်ပါ-

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

### ထည့်လုပ် စမ်းသပ်မှု

မတူညီသော SKU များကို စမ်းသပ်၍ စွမ်းဆောင်ရည်ကို အတည်ပြုပါ-

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### စောင့်ကြည့်မှုနှင့် ထိရောက်အောင် လုပ်ဆောင်ခြင်း

အပြည့်အစုံ စောင့်ကြည့်မှု စနစ်ကို တပ်ဆင်ပါ-

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

## အမြန် ရည်ညွှန်း စာတမ်းများ

### App Service SKU အမြန် ညွှန်ကြားစာရင်း

| SKU | အဆင့် | vCPU | RAM | သိုလှောင်မှု | စျေးနှုန်း အကွာအဝေး | အသုံးပြုမှုအမျိုးအစား |
|-----|------|------|-----|---------|-------------|----------|
| F1 | အခမဲ့ | ဝေစု | ၁ဂီဘီ | ၁ဂီဘီ | အခမဲ့ | ဖွံ့ဖြိုးရေး |
| B1 | အခြေခံ | ၁ | ၁.၇၅ဂီဘီ | ၁၀ဂီဘီ | $ | သေးငယ်သော အက်ပ်များ |
| S1 | စံချိန် | ၁ | ၁.၇၅ဂီဘီ | ၅၀ဂီဘီ | $$ | ထုတ်လုပ်မှု |
| P1V3 | Premium V3 | ၂ | ၈ဂီဘီ | ၂၅၀ဂီဘီ | $$$ | မြင့်မားသော စွမ်းဆောင်ရည် |
| I1V2 | ခွဲခြား ထားသော V2 | ၂ | ၈ဂီဘီ | ၁တီဘီ | $$$$ | စီးပွားရေးအဖွဲ့အစည်းများ |

### SQL Database SKU အမြန် ညွှန်းစာရင်း

| SKU | အဆင့် | DTU/vCore | သိုလှောင်မှု | စျေးနှုန်း အကွာအဝေး | အသုံးပြုမှုအမျိုးအစား |
|-----|------|-----------|---------|-------------|----------|
| Basic | အခြေခံ | ၅ DTU | ၂ဂီဘီ | $ | ဖွံ့ဖြိုးရေး |
| S2 | စံချိန် | ၅၀ DTU | ၂၅၀ဂီဘီ | $$ | သေးငယ်သော ထုတ်လုပ်မှု |
| P2 | Premium | ၂၅၀ DTU | ၁တီဘီ | $$$ | မြင့်မားသော စွမ်းဆောင်ရည် |
| GP_Gen5_4 | အထွေထွေ သုံး | ၄ vCore | ၄တီဘီ | $$$ | ကန့်သတ်မှုဖြည့်သွင်းချက် |
| BC_Gen5_8 | စီးပွားရေး အရေးကြီး | ၈ vCore | ၄တီဘီ | $$$$ | လုပ်ငန်းအရေးကြီး |

### Container Apps SKU အမြန် ညွှန်းစာရင်း

| ပုံစံ | စျေးနှုန်း | CPU/မေမရီ | အသုံးပြုမှုအမျိုးအစား |
|-------|---------|------------|----------|
| စားသုံးမှု | အသုံးအလိုက် ပေးချေမှု | ပတ်ဝန်းကျင်/ပရိုဖိုင်အပေါ် မူတည်၍ CPU/မေမရီ ပေါင်းစပ်မှုများ | ဖွံ့ဖြိုးရေး သို့မဟုတ် ထုတ်လုပ်မှု, အပြောင်းအလဲ လုပ်ငန်း |
| သီးသန့် D4 | သီးသန့် node ငွေပေးချေမှု | node တစ်ခုလျှင် ၄ vCPU, ၁၆GiB | တည်တံ့သော လုပ်ငန်းလုပ်များ/ သီးခြားလိုအပ်ချက်များ |
| သီးသန့် D8 | သီးသန့် node ငွေပေးချေမှု | node တစ်ခုလျှင် ၈ vCPU, ၃၂GiB | မြင့်မားသော တည်တံ့သော လုပ်ငန်း |

---

## အတည်ပြု ကိရိယာများ

### SKU ရရှိနိုင်မှု စစ်ဆေးသူ

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

### ကုန်ကျစရိတ် ခန့်မှန်းမှု စာရေးစက်

**Pseudocode ပုံစံသာ**: `Get-ResourceCost` အောက်တွင်ဖော်ပြထားသည်မှာ လက်ရှိ ဒေသဆိုင်ရာ/စာချုပ် စျေးနှုန်းများနှင့် အသုံးပြုမှုသဘောတူညီချက်များကို အသုံးပြုပြီး သင်ဖန်တီးရမည့် ပရိုဂျက်အရ ကိုယ်ပိုင်လုပ်ဆောင်မှု ဖြစ်သည်။ ၎င်းသည် PowerShell သို့မဟုတ် Azure cmdlet မဟုတ်ပါ။

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

### စွမ်းဆောင်ရည် အတည်ပြုခြင်း

အောက်တွင် ပါသော YAML သည် လိုအပ်ချက်ကိရိယာရေးဆွဲချက်ဖြစ်ပြီး၊ **Azure Load Testing, JMeter, Locust, သို့ k6 ဖြင့်သာမက** တခြား load-test command အသုံးပြုမည့် ကိရိယာ လူကြိုက်များအတွက် အခြေခံ ဂဏန်းမဖြစ်ပါ။ အကောင်းဆုံး ဖြစ်အောင် သင့်ရွေးချယ်ထားသည့် ကိရိယာကိရိယာ၏ ပြင်ဆင်မှု ဆောင်ရွက်ကြပါ။

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

## အကောင်းဆုံးလုပ်ထုံးလုပ်နည်း အကျဉ်းချုပ်

### လုပ်သင့်သော အရာများ

၁။ **အရွယ်အစားသေးငယ်စဉ် အစတင်ပြီး တစ်ဆင့်ချင်းတိုး မြှင့်ရန်**
၂။ **ပတ်ဝန်းကျင်ကွာခြားမှုအပေါ် မူတည်၍ SKU များကို ခွဲခြားအသုံးပြုပါ**
၃။ **စွမ်းဆောင်ရည်နှင့် ကုန်ကျစရိတ်များကို ဆက်လက် စောင့်ကြည့်ပါ**
၄။ **ထုတ်လုပ်မှု လုပ်ငန်းတာဝန်များအတွက် သိမ်းဆည်းထားမှု စွမ်းအား အသုံးချပါ**
၅။ **တတ်နိုင်သည့် နေရာတွင် အလိုအလျောက် တိုးချဲ့မှု ပြုလုပ်ပါ**
၆။ **တရားဝင် လုပ်ငန်းတာဝန်များကို စမ်းသပ်ပါ**
၇။ **တိုးချဲ့မှု ရှေ့လျှောက် မှုကို စီမံကိန်းရေးဆွဲပါ၊ သို့သော် မလွန်စိုက်ပါနှင့်**
၈။ **ဖွံ့ဖြိုးရေးအတွက် အခမဲ့ အဆင့်များကို အသုံးပြုပါ**

### မလုပ်သင့်သော အရာများ

၁။ **ဖွံ့ဖြိုးရေးအတွက် ထုတ်လုပ်မှု SKU များ မသုံးပါနှင့်**
၂။ **ဒေသတစ်ခုလျှင် SKU ရရှိနိုင်မှု မလျှောက်ထားပါနှင့်**
၃။ **ဒေတာ လွှဲပြောင်းမှု ကုန်ကျစရိတ် မမေ့ပါနှင့်**
၄။ **အခြားအကြောင်းပြချက် မရှိဘဲ တိုးမြှင့်အား မလုပ်ပါနှင့်**
၅။ **မူလတွဲလက်ခံမှု အကျိုးသက်ရောက်မှု မမေ့ပါနှင့်**
၆။ **အလိုအလျောက်တိုးချဲ့မှု နောက်ဆုံးကန့်သတ်ချက်များကို မမြင့်မားစွာ သတ်မှတ်ပါနှင့်**
၇။ **စည်းမျဉ်းစည်းကမ်းလိုအပ်ချက် မမေ့ပါနှင့်**
၈။ **စျေးနှုန်းသာမူတည်၍ ဆုံးဖြတ်မှု မလုပ်ပါနှင့်**

---

**အကြံပြုချက်**: သင့်လက်တွေ့ အသုံးပြုမှု ပုံစံများအပေါ် မူတည်၍ Azure Cost Management နှင့် Advisor ကို အသုံးပြုပြီး ကိုယ်ပိုင် SKU ရွေးချယ်မှု အကြံပြုချက်များ ရရှိပါ။

---

**လမ်းညွှန်မျှဝေမှု**
- **ယခင်သင်ခန်းစာ**: [စွမ်းဆောင်ရည် စီမံကိန်းရေးဆွဲခြင်း](capacity-planning.md)
- **နောက်သင်ခန်းစာ**: [ပျံ့နှံ့ရန် စစ်ဆေးမှုများ](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->