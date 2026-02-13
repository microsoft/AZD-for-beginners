# SKU নির্বাচন গাইড - সঠিক Azure সার্ভিস টিয়ার নির্বাচন

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [শুরুদের জন্য AZD](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার 6 - প্রি-ডিপ্লয়মেন্ট যাচাই ও পরিকল্পনা
- **⬅️ পূর্ববর্তী**: [ক্যাপাসিটি পরিকল্পনা](capacity-planning.md)
- **➡️ পরবর্তী**: [প্রি-ফ্লাইট চেকস](preflight-checks.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [চ্যাপ্টার 7: সমস্যা সমাধান](../chapter-07-troubleshooting/common-issues.md)

## ভূমিকা

এই বিস্তৃত গাইডটি আপনাকে বিভিন্ন পরিবেশ, ওয়ার্কলোড, এবং চাহিদার জন্য অনুকূল Azure সার্ভিস SKU (Stock Keeping Units) নির্বাচন করতে সাহায্য করে। আপনার Azure Developer CLI ডিপ্লয়মেন্টের জন্য সবচেয়ে উপযুক্ত সার্ভিস টিয়ারগুলি নির্বাচন করতে পারফরম্যান্স চাহিদা, খরচ বিবেচনা এবং স্কেলেবিলিটি প্রয়োজনীয়তা বিশ্লেষণ করতে শিখুন।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করলে আপনি:
- Azure SKU ধারণা, মূল্য নির্ধারণ মডেল এবং ফিচার পার্থক্য বুঝতে পারবেন
- ডেভেলপমেন্ট, স্টেজিং এবং প্রোডাকশনের জন্য পরিবেশ-নির্দিষ্ট SKU নির্বাচন কৌশল আয়ত্ত করতে পারবেন
- ওয়ার্কলোড চাহিদা বিশ্লেষণ করে সেগুলোকে উপযুক্ত সার্ভিস টিয়ারের সাথে মিলাতে পারবেন
- বুদ্ধিমত্তাপূর্ণ SKU নির্বাচনের মাধ্যমে খরচ অপ্টিমাইজেশন কৌশল বাস্তবায়ন করতে পারবেন
- SKU নির্বাচনের জন্য পারফরম্যান্স টেস্টিং এবং ভ্যালিডেশন কৌশল প্রয়োগ করতে পারবেন
- স্বয়ংক্রিয় SKU সুপারিশ এবং মনিটরিং কনফিগার করতে পারবেন

## শেখার ফলাফল

সম্পন্ন করার পরে, আপনি সক্ষম হবেন:
- ওয়ার্কলোড চাহিদা এবং সীমাবদ্ধতা অনুযায়ী উপযুক্ত Azure সার্ভিস SKU নির্বাচন করতে
- সঠিক টিয়ার নির্বাচন করে খরচ-কার্যকর বহু-পরিবেশ আর্কিটেকচার ডিজাইন করতে
- SKU নির্বাচনের জন্য পারফরম্যান্স বেঞ্চমার্কিং এবং ভ্যালিডেশন বাস্তবায়ন করতে
- SKU সুপারিশ এবং খরচ অপ্টিমাইজেশনের জন্য স্বয়ংক্রিয় টুল তৈরি করতে
- পরিবর্তিত চাহিদার জন্য SKU মাইগ্রেশন এবং স্কেলিং কৌশল পরিকল্পনা করতে
- সার্ভিস টিয়ার নির্বাচনে Azure Well-Architected Framework নীতিমালা প্রয়োগ করতে

## সূচিপত্র

- [SKUসমূহ বোঝা](../../../../docs/chapter-06-pre-deployment)
- [পরিবেশ-ভিত্তিক নির্বাচন](../../../../docs/chapter-06-pre-deployment)
- [সার্ভিস-নির্দিষ্ট নির্দেশিকা](../../../../docs/chapter-06-pre-deployment)
- [খরচ অপ্টিমাইজেশন কৌশল](../../../../docs/chapter-06-pre-deployment)
- [পারফরম্যান্স বিবেচ্য বিষয়সমূহ](../../../../docs/chapter-06-pre-deployment)
- [দ্রুত রেফারেন্স টেবিল](../../../../docs/chapter-06-pre-deployment)
- [ভ্যালিডেশন টুলস](../../../../docs/chapter-06-pre-deployment)

---

## SKUs বোঝা

### SKU কী?

SKU (Stock Keeping Units) Azure রিসোর্সগুলির জন্য বিভিন্ন সার্ভিস টিয়ার এবং পারফরম্যান্স স্তর উপস্থাপন করে। প্রতিটি SKU বিভিন্ন অফার করে:

- **পারফরম্যান্স বৈশিষ্ট্য** (CPU, মেমরি, থ্রুপুট)
- **ফিচার উপলব্ধতা** (স্কেলিং অপশন, SLA স্তর)
- **মূল্য নির্ধারণ মডেল** (নির্বাহভিত্তিক, রিজার্ভড ক্যাপাসিটি)
- **আঞ্চলিক উপলব্ধতা** (সব অঞ্চলে সব SKU পাওয়া যায় না)

### SKU নির্বাচন করার প্রধান বিষয়গুলো

1. **ওয়ার্কলোড চাহিদা**
   - অনুমানিত ট্রাফিক/লোড প্যাটার্ন
   - পারফরম্যান্স চাহিদা (CPU, মেমরি, I/O)
   - স্টোরেজ প্রয়োজন এবং অ্যাক্সেস প্যাটার্ন

2. **পরিবেশের ধরন**
   - ডেভেলপমেন্ট/টেস্টিং বনাম প্রোডাকশন
   - উপলব্ধতার চাহিদা
   - সিকিউরিটি এবং কমপ্লায়েন্স প্রয়োজনীয়তা

3. **বাজেট সীমাবদ্ধতা**
   - প্রাথমিক খরচ বনাম অপারেশনাল খরচ
   - রিজার্ভড ক্যাপাসিটি ডিসকাউন্ট
   - অটো-স্কেলিংয়ের খরচগত প্রভাব

4. **বৃদ্ধির পূর্বাভাস**
   - স্কেলেবিলিটি চাহিদা
   - ভবিষ্যতের ফিচার প্রয়োজন
   - মাইগ্রেশন জটিলতা

---

## পরিবেশ-ভিত্তিক নির্বাচন

### ডেভেলপমেন্ট পরিবেশ

**প্রাধান্য**: খরচ অপ্টিমাইজেশন, মৌলিক কার্যকারিতা, সহজ প্রোভিশনিং/ডি-প্রোভিশনিং

#### সুপারিশকৃত SKUs
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

#### বৈশিষ্ট্যসমূহ
- **App Service**: F1 (Free) বা B1 (Basic) সহজ পরীক্ষার জন্য
- **Databases**: ন্যূনতম রিসোর্স সহ Basic টিয়ার
- **Storage**: শুধুমাত্র লোকাল রিডানডেন্সি সহ Standard
- **Compute**: শেয়ার্ড রিসোর্স গ্রহণযোগ্য
- **Networking**: মৌলিক কনফিগারেশন

### স্টেজিং/টেস্টিং পরিবেশ

**প্রাধান্য**: প্রোডাকশন-সদৃশ কনফিগারেশন, খরচের ভারসাম্য, পারফরম্যান্স টেস্টিং সক্ষমতা

#### সুপারিশকৃত SKUs
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

#### বৈশিষ্ট্যসমূহ
- **Performance**: উৎপাদন ক্ষমতার 70-80%
- **Features**: বেশিরভাগ প্রোডাকশন ফিচার সক্রিয়
- **Redundancy**: কিছু ভৌগোলিক রিডানডেন্সি
- **Scaling**: পরীক্ষার জন্য সীমিত অটো-স্কেলিং
- **Monitoring**: সম্পূর্ণ মনিটরিং স্ট্যাক

### প্রোডাকশন পরিবেশ

**প্রাধান্য**: পারফরম্যান্স, উপলব্ধতা, সিকিউরিটি, কমপ্লায়েন্স, স্কেলেবিলিটি

#### সুপারিশকৃত SKUs
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

#### বৈশিষ্ট্যসমূহ
- **High availability**: 99.9%+ SLA চাহিদা
- **Performance**: ডেডিকেটেড রিসোর্স, উচ্চ থ্রুপুট
- **Security**: প্রিমিয়াম নিরাপত্তা ফিচার
- **Scaling**: পূর্ণ অটো-স্কেলিং ক্ষমতা
- **Monitoring**: বিস্তৃত অবজার্ভেবিলিটি

---

## সার্ভিস-নির্দিষ্ট নির্দেশিকা

### Azure App Service

#### SKU সিদ্ধান্ত ম্যাট্রিক্স

| ব্যবহারের পরিস্থিতি | সুপারিশকৃত SKU | যুক্তি |
|----------|----------------|-----------|
| ডেভেলপমেন্ট/টেস্টিং | F1 (Free) or B1 (Basic) | খরচ-সাশ্রয়ী, টেস্টিংয়ের জন্য যথেষ্ট |
| ছোট প্রোডাকশন অ্যাপ | S1 (Standard) | কাস্টম ডোমেন, SSL, অটো-স্কেলিং |
| মাঝারি প্রোডাকশন অ্যাপ | P1V3 (Premium V3) | উন্নত পারফরম্যান্স, বেশি ফিচার |
| উচ্চ-ট্রাফিক অ্যাপ | P2V3 or P3V3 | ডেডিকেটেড রিসোর্স, উচ্চ পারফরম্যান্স |
| মিশন-ক্রিটিক্যাল অ্যাপ | I1V2 (Isolated V2) | নেটওয়ার্ক আইসোলেশন, ডেডিকেটেড হার্ডওয়্যার |

#### কনফিগারেশন উদাহরণ

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

#### SKU নির্বাচন ফ্রেমওয়ার্ক

1. **DTU-ভিত্তিক (Database Transaction Units)**
   - **Basic**: 5 DTU - ডেভেলপমেন্ট/টেস্টিং
   - **Standard**: S0-S12 (10-3000 DTU) - সাধারণ উদ্দেশ্য
   - **Premium**: P1-P15 (125-4000 DTU) - পারফরম্যান্স-সমালোচনামূলক

2. **vCore-ভিত্তিক** (প্রোডাকশনের জন্য সুপারিশকৃত)
   - **General Purpose**: সমতুল্য কম্পিউট এবং স্টোরেজ
   - **Business Critical**: নিম্ন ল্যাটেন্সি, উচ্চ IOPS
   - **Hyperscale**: অত্যন্ত স্কেলযোগ্য স্টোরেজ (প্রায় 100TB পর্যন্ত)

#### উদাহরণ কনফিগারেশন

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

#### পরিবেশের ধরন

1. **কনজাম্পশন-ভিত্তিক**
   - ব্যবহারের ভিত্তিতে বিলিং
   - ডেভেলপমেন্ট এবং পরিবর্তনশীল ওয়ার্কলোডের জন্য উপযুক্ত
   - শেয়ার্ড ইনফ্রাস্ট্রাকচার

2. **ডেডিকেটেড (ওয়ার্কলোড প্রোফাইল)**
   - ডেডিকেটেড কম্পিউট রিসোর্স
   - পূর্বানুমানযোগ্য পারফরম্যান্স
   - প্রোডাকশন ওয়ার্কলোডের জন্য উত্তম

#### কনফিগারেশন উদাহরণ

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

#### থ্রুপুট মডেল

1. **ম্যানুয়াল প্রোভিশন্ড থ্রুপুট**
   - পূর্বানুমানযোগ্য পারফরম্যান্স
   - রিজার্ভড ক্যাপাসিটি ডিসকাউন্ট
   - স্থিতিশীল ওয়ার্কলোডের জন্য উত্তম

2. **অটোস্কেল প্রোভিশন্ড থ্রুপুট**
   - ব্যবহার অনুযায়ী স্বয়ংক্রিয় স্কেলিং
   - আপনি যা ব্যবহার করবেন তার জন্যই পেমেন্ট (সর্বনিম্ন সহ)
   - পরিবর্তনশীল ওয়ার্কলোডের জন্য ভালো

3. **সার্ভারলেস**
   - অনুরোধ-প্রতি পেমেন্ট
   - কোনো প্রোভিশন্ড থ্রুপুট নেই
   - ডেভেলপমেন্ট এবং সময়ে সময়ে হওয়া ওয়ার্কলোডের জন্য উপযুক্ত

#### SKU উদাহরণ

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

#### স্টোরেজ অ্যাকাউন্ট টাইপ

1. **Standard_LRS** - ডেভেলপমেন্ট, অ-সমালোচনামূলক ডেটা
2. **Standard_GRS** - প্রোডাকশন, জিও-রিডানডেন্সি প্রয়োজন
3. **Premium_LRS** - উচ্চ-দক্ষতা অ্যাপ্লিকেশন
4. **Premium_ZRS** - জোন রিডানডেন্সি সহ উচ্চ উপস্থিতি

#### পারফরম্যান্স টিয়ার

- **Standard**: সাধারণ উদ্দেশ্য, খরচ-কার্যকর
- **Premium**: উচ্চ-দক্ষতা, নিম্ন-লেটেন্সি পরিস্থিতি

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

## খরচ অপ্টিমাইজেশন কৌশল

### 1. রিজার্ভড ক্যাপাসিটি

উল্লেখযোগ্য ডিসকাউন্টের জন্য 1-3 বছরের জন্য রিসোর্স রিজার্ভ করুন:

```bash
# রিজার্ভেশন বিকল্পগুলি পরীক্ষা করুন
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. রাইট-সাইজিং

ছোট SKUs দিয়ে শুরু করুন এবং প্রকৃত ব্যবহার অনুযায়ী স্কেল আপ করুন:

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

### 3. অটো-স্কেলিং কনফিগারেশন

খরচ অপ্টিমাইজ করতে বুদ্ধিমান স্কেলিং বাস্তবায়ন করুন:

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

### 4. শিডিউল্ড স্কেলিং

অফ-আওয়ারে স্কেল ডাউন করুন:

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

## পারফরম্যান্স বিবেচ্য বিষয়সমূহ

### বেসলাইন পারফরম্যান্স চাহিদা

SKU নির্বাচন করার আগে স্পষ্ট পারফরম্যান্স চাহিদা নির্ধারণ করুন:

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

### লোড টেস্টিং

পারফরম্যান্স যাচাইয়ের জন্য বিভিন্ন SKU টেস্ট করুন:

```bash
# অ্যাজুর লোড টেস্টিং সেবা
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### মনিটরিং এবং অপ্টিমাইজেশন

সম্পূর্ণ মনিটরিং সেট করুন:

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

## দ্রুত রেফারেন্স টেবিল

### App Service SKU দ্রুত রেফারেন্স

| SKU | টিয়ার | vCPU | RAM | স্টোরেজ | মূল্য পরিসর | ব্যবহারের পরিস্থিতি |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | শেয়ার্ড | 1GB | 1GB | Free | ডেভেলপমেন্ট |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | ছোট অ্যাপ |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | প্রোডাকশন |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | উচ্চ পারফরম্যান্স |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | এন্টারপ্রাইজ |

### SQL Database SKU দ্রুত রেফারেন্স

| SKU | টিয়ার | DTU/vCore | স্টোরেজ | মূল্য পরিসর | ব্যবহারের পরিস্থিতি |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | ডেভেলপমেন্ট |
| S2 | Standard | 50 DTU | 250GB | $$ | ছোট প্রোডাকশন |
| P2 | Premium | 250 DTU | 1TB | $$$ | উচ্চ পারফরম্যান্স |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | সমতুল্য |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | মিশন ক্রিটিক্যাল |

### Container Apps SKU দ্রুত রেফারেন্স

| মডেল | মূল্য নির্ধারণ | CPU/মেমরি | ব্যবহারের পরিস্থিতি |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | ডেভেলপমেন্ট, পরিবর্তনশীল লোড |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | প্রোডাকশন |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | উচ্চ পারফরম্যান্স |

---

## ভ্যালিডেশন টুলস

### SKU উপলব্ধতা চেকার

```bash
#!/bin/bash
# টার্গেট অঞ্চলে SKU-এর উপলব্ধতা যাচাই করুন

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

# ব্যবহার
check_sku_availability "eastus" "app-service" "P1V3"
```

### খরচ অনুমান স্ক্রিপ্ট

```powershell
# খরচ অনুমানের জন্য PowerShell স্ক্রিপ্ট
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
        
        # Azure Pricing API বা ক্যালকুলেটর ব্যবহার করুন
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# ব্যবহার
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### পারফরম্যান্স ভ্যালিডেশন

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

## সর্বোত্তম অনুশীলনের সারসংক্ষেপ

### করা উচিত

1. **ছোট থেকে শুরু করুন এবং স্কেল আপ করুন** প্রকৃত ব্যবহার অনুযায়ী
2. **বিভিন্ন পরিবেশের জন্য বিভিন্ন SKUs ব্যবহার করুন**
3. **পারফরম্যান্স এবং খরচ অব্যাহতভাবে মনিটর করুন**
4. **প্রোডাকশন ওয়ার্কলোডের জন্য রিজার্ভড ক্যাপাসিটি ব্যবহার করুন**
5. **যথাযোগ্য স্থানে অটো-স্কেলিং বাস্তবায়ন করুন**
6. **বাস্তবসম্মত ওয়ার্কলোড দিয়ে পারফরম্যান্স টেস্ট করুন**
7. **বৃদ্ধির পরিকল্পনা করুন কিন্তু ওভার-প্রোভিশনিং থেকে বিরত থাকুন**
8. **যদি সম্ভব হয় ডেভেলপমেন্টে ফ্রি টিয়ার ব্যবহার করুন**

### করা উচিত নয়

1. **ডেভেলপমেন্টের জন্য প্রোডাকশন SKUs ব্যবহার করবেন না**
2. **আঞ্চলিক SKU উপলব্ধতাকে উপেক্ষা করবেন না**
3. **ডেটা ট্রান্সফার খরচ ভুলে যাবেন না**
4. **বিচার ছাড়া অতিরিক্ত প্রোভিশন করবেন না**
5. **ডিপেন্ডেন্সিগুলোর প্রভাব উপেক্ষা করবেন না**
6. **অটো-স্কেলিং সীমা অনেক বেশি নির্ধারণ করবেন না**
7. **কোমপ্লায়েন্স চাহিদা ভুলে যাবেন না**
8. **শুধু মূল্য দেখে সিদ্ধান্ত নেবেন না**

---

**প্রো টিপ**: Azure Cost Management এবং Advisor ব্যবহার করে প্রকৃত ব্যবহার প্যাটার্নের উপর ভিত্তি করে আপনার SKU নির্বাচনের অপ্টিমাইজেশনের জন্য ব্যক্তিগতকৃত সুপারিশ পান।

---

**নেভিগেশন**
- **পূর্বের লেসন**: [ক্যাপাসিটি পরিকল্পনা](capacity-planning.md)
- **পরবর্তী লেসন**: [প্রি-ফ্লাইট চেকস](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাযথতা বজায় রাখার চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে। স্থানীয় (মাতৃ) ভাষায় থাকা মূল নথিকেই কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেওয়া হয়। এই অনুবাদের ব্যবহারের ফলে উদ্ভূত কোনো ভুল বোঝাবুঝি বা ভ্রান্ত ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->