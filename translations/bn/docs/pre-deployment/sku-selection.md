<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T19:48:50+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "bn"
}
-->
# SKU নির্বাচন গাইড - সঠিক Azure সার্ভিস টিয়ার বেছে নেওয়া

## ভূমিকা

এই বিস্তৃত গাইডটি আপনাকে বিভিন্ন পরিবেশ, কাজের চাপ এবং প্রয়োজনীয়তার জন্য উপযুক্ত Azure সার্ভিস SKU (স্টক কিপিং ইউনিট) নির্বাচন করতে সাহায্য করবে। পারফরম্যান্সের প্রয়োজনীয়তা, খরচ বিবেচনা এবং স্কেলযোগ্যতার প্রয়োজনীয়তা বিশ্লেষণ করতে শিখুন, যাতে Azure Developer CLI ডিপ্লয়মেন্টের জন্য সবচেয়ে উপযুক্ত সার্ভিস টিয়ার নির্বাচন করা যায়।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করার মাধ্যমে আপনি:
- Azure SKU ধারণা, মূল্য নির্ধারণ মডেল এবং বৈশিষ্ট্যের পার্থক্য বুঝতে পারবেন
- ডেভেলপমেন্ট, স্টেজিং এবং প্রোডাকশনের জন্য পরিবেশ-নির্দিষ্ট SKU নির্বাচন কৌশল আয়ত্ত করবেন
- কাজের চাপের প্রয়োজনীয়তা বিশ্লেষণ করে উপযুক্ত সার্ভিস টিয়ারের সাথে মিল করবেন
- বুদ্ধিমত্তার সাথে SKU নির্বাচন করে খরচ অপ্টিমাইজেশন কৌশল বাস্তবায়ন করবেন
- SKU নির্বাচনগুলোর জন্য পারফরম্যান্স টেস্টিং এবং যাচাইকরণ কৌশল প্রয়োগ করবেন
- SKU সুপারিশ এবং মনিটরিং স্বয়ংক্রিয়ভাবে কনফিগার করবেন

## শেখার ফলাফল

গাইড সম্পন্ন করার পর আপনি:
- কাজের চাপের প্রয়োজনীয়তা এবং সীমাবদ্ধতার উপর ভিত্তি করে উপযুক্ত Azure সার্ভিস SKU নির্বাচন করতে পারবেন
- সঠিক টিয়ার নির্বাচন করে খরচ-কার্যকর বহু-পরিবেশ আর্কিটেকচার ডিজাইন করতে পারবেন
- SKU নির্বাচনগুলোর জন্য পারফরম্যান্স বেঞ্চমার্কিং এবং যাচাইকরণ বাস্তবায়ন করতে পারবেন
- SKU সুপারিশ এবং খরচ অপ্টিমাইজেশনের জন্য স্বয়ংক্রিয় টুল তৈরি করতে পারবেন
- পরিবর্তনশীল প্রয়োজনীয়তার জন্য SKU মাইগ্রেশন এবং স্কেলিং কৌশল পরিকল্পনা করতে পারবেন
- Azure Well-Architected Framework নীতিগুলি সার্ভিস টিয়ার নির্বাচনে প্রয়োগ করতে পারবেন

## বিষয়সূচি

- [SKU সম্পর্কে বোঝা](../../../../docs/pre-deployment)
- [পরিবেশ-ভিত্তিক নির্বাচন](../../../../docs/pre-deployment)
- [সার্ভিস-নির্দিষ্ট নির্দেশিকা](../../../../docs/pre-deployment)
- [খরচ অপ্টিমাইজেশন কৌশল](../../../../docs/pre-deployment)
- [পারফরম্যান্স বিবেচনা](../../../../docs/pre-deployment)
- [দ্রুত রেফারেন্স টেবিল](../../../../docs/pre-deployment)
- [যাচাইকরণ টুল](../../../../docs/pre-deployment)

---

## SKU সম্পর্কে বোঝা

### SKU কী?

SKU (স্টক কিপিং ইউনিট) Azure রিসোর্সের বিভিন্ন সার্ভিস টিয়ার এবং পারফরম্যান্স লেভেলকে উপস্থাপন করে। প্রতিটি SKU বিভিন্ন বৈশিষ্ট্য প্রদান করে:

- **পারফরম্যান্স বৈশিষ্ট্য** (CPU, মেমরি, থ্রুপুট)
- **বৈশিষ্ট্য উপলব্ধতা** (স্কেলিং অপশন, SLA লেভেল)
- **মূল্য নির্ধারণ মডেল** (কনজাম্পশন-ভিত্তিক, রিজার্ভড ক্যাপাসিটি)
- **আঞ্চলিক উপলব্ধতা** (সব SKU সব অঞ্চলে উপলব্ধ নয়)

### SKU নির্বাচন করার মূল বিষয়

1. **কাজের চাপের প্রয়োজনীয়তা**
   - প্রত্যাশিত ট্রাফিক/লোড প্যাটার্ন
   - পারফরম্যান্সের প্রয়োজনীয়তা (CPU, মেমরি, I/O)
   - স্টোরেজের প্রয়োজন এবং অ্যাক্সেস প্যাটার্ন

2. **পরিবেশের ধরন**
   - ডেভেলপমেন্ট/টেস্টিং বনাম প্রোডাকশন
   - উপলব্ধতার প্রয়োজনীয়তা
   - নিরাপত্তা এবং কমপ্লায়েন্সের প্রয়োজনীয়তা

3. **বাজেট সীমাবদ্ধতা**
   - প্রাথমিক খরচ বনাম অপারেশনাল খরচ
   - রিজার্ভড ক্যাপাসিটি ডিসকাউন্ট
   - অটো-স্কেলিংয়ের খরচ প্রভাব

4. **বৃদ্ধির পূর্বাভাস**
   - স্কেলযোগ্যতার প্রয়োজনীয়তা
   - ভবিষ্যতের বৈশিষ্ট্যের প্রয়োজন
   - মাইগ্রেশনের জটিলতা

---

## পরিবেশ-ভিত্তিক নির্বাচন

### ডেভেলপমেন্ট পরিবেশ

**অগ্রাধিকার**: খরচ অপ্টিমাইজেশন, মৌলিক কার্যকারিতা, সহজ প্রভিশনিং/ডি-প্রভিশনিং

#### প্রস্তাবিত SKU
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

#### বৈশিষ্ট্য
- **অ্যাপ সার্ভিস**: F1 (ফ্রি) বা B1 (বেসিক) সাধারণ টেস্টিংয়ের জন্য
- **ডাটাবেস**: ন্যূনতম রিসোর্স সহ বেসিক টিয়ার
- **স্টোরেজ**: শুধুমাত্র স্থানীয় রিডান্ডেন্সি সহ স্ট্যান্ডার্ড
- **কম্পিউট**: শেয়ারড রিসোর্স গ্রহণযোগ্য
- **নেটওয়ার্কিং**: বেসিক কনফিগারেশন

### স্টেজিং/টেস্টিং পরিবেশ

**অগ্রাধিকার**: প্রোডাকশন-সদৃশ কনফিগারেশন, খরচের ভারসাম্য, পারফরম্যান্স টেস্টিং সক্ষমতা

#### প্রস্তাবিত SKU
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

#### বৈশিষ্ট্য
- **পারফরম্যান্স**: প্রোডাকশন ক্ষমতার ৭০-৮০%
- **বৈশিষ্ট্য**: প্রোডাকশনের বেশিরভাগ বৈশিষ্ট্য সক্রিয়
- **রিডান্ডেন্সি**: কিছু ভৌগোলিক রিডান্ডেন্সি
- **স্কেলিং**: টেস্টিংয়ের জন্য সীমিত অটো-স্কেলিং
- **মনিটরিং**: পূর্ণ মনিটরিং স্ট্যাক

### প্রোডাকশন পরিবেশ

**অগ্রাধিকার**: পারফরম্যান্স, উপলব্ধতা, নিরাপত্তা, কমপ্লায়েন্স, স্কেলযোগ্যতা

#### প্রস্তাবিত SKU
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

#### বৈশিষ্ট্য
- **উচ্চ উপলব্ধতা**: ৯৯.৯%+ SLA প্রয়োজনীয়তা
- **পারফরম্যান্স**: ডেডিকেটেড রিসোর্স, উচ্চ থ্রুপুট
- **নিরাপত্তা**: প্রিমিয়াম নিরাপত্তা বৈশিষ্ট্য
- **স্কেলিং**: পূর্ণ অটো-স্কেলিং সক্ষমতা
- **মনিটরিং**: ব্যাপক পর্যবেক্ষণ

---

## সার্ভিস-নির্দিষ্ট নির্দেশিকা

### Azure App Service

#### SKU সিদ্ধান্ত ম্যাট্রিক্স

| ব্যবহার ক্ষেত্র | প্রস্তাবিত SKU | কারণ |
|----------------|----------------|------|
| ডেভেলপমেন্ট/টেস্টিং | F1 (ফ্রি) বা B1 (বেসিক) | খরচ-কার্যকর, টেস্টিংয়ের জন্য যথেষ্ট |
| ছোট প্রোডাকশন অ্যাপ | S1 (স্ট্যান্ডার্ড) | কাস্টম ডোমেইন, SSL, অটো-স্কেলিং |
| মাঝারি প্রোডাকশন অ্যাপ | P1V3 (প্রিমিয়াম V3) | উন্নত পারফরম্যান্স, আরও বৈশিষ্ট্য |
| উচ্চ-ট্রাফিক অ্যাপ | P2V3 বা P3V3 | ডেডিকেটেড রিসোর্স, উচ্চ পারফরম্যান্স |
| মিশন-ক্রিটিক্যাল অ্যাপ | I1V2 (আইসোলেটেড V2) | নেটওয়ার্ক আইসোলেশন, ডেডিকেটেড হার্ডওয়্যার |

#### কনফিগারেশন উদাহরণ

**ডেভেলপমেন্ট**
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

**প্রোডাকশন**
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

#### SKU নির্বাচন কাঠামো

1. **DTU-ভিত্তিক (ডাটাবেস ট্রানজ্যাকশন ইউনিট)**
   - **বেসিক**: ৫ DTU - ডেভেলপমেন্ট/টেস্টিং
   - **স্ট্যান্ডার্ড**: S0-S12 (১০-৩০০০ DTU) - সাধারণ উদ্দেশ্য
   - **প্রিমিয়াম**: P1-P15 (১২৫-৪০০০ DTU) - পারফরম্যান্স-ক্রিটিক্যাল

2. **vCore-ভিত্তিক** (প্রোডাকশনের জন্য সুপারিশকৃত)
   - **জেনারেল পারপাস**: ব্যালেন্সড কম্পিউট এবং স্টোরেজ
   - **বিজনেস ক্রিটিক্যাল**: কম লেটেন্সি, উচ্চ IOPS
   - **হাইপারস্কেল**: অত্যন্ত স্কেলযোগ্য স্টোরেজ (১০০TB পর্যন্ত)

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
   - ব্যবহার অনুযায়ী মূল্য নির্ধারণ
   - ডেভেলপমেন্ট এবং পরিবর্তনশীল কাজের চাপের জন্য উপযুক্ত
   - শেয়ারড অবকাঠামো

2. **ডেডিকেটেড (ওয়ার্কলোড প্রোফাইল)**
   - ডেডিকেটেড কম্পিউট রিসোর্স
   - পূর্বানুমানযোগ্য পারফরম্যান্স
   - প্রোডাকশন কাজের চাপের জন্য ভালো

#### কনফিগারেশন উদাহরণ

**ডেভেলপমেন্ট (কনজাম্পশন)**
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

**প্রোডাকশন (ডেডিকেটেড)**
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

1. **ম্যানুয়াল প্রভিশনড থ্রুপুট**
   - পূর্বানুমানযোগ্য পারফরম্যান্স
   - রিজার্ভড ক্যাপাসিটি ডিসকাউন্ট
   - স্থিতিশীল কাজের চাপের জন্য সেরা

2. **অটোস্কেল প্রভিশনড থ্রুপুট**
   - ব্যবহার অনুযায়ী স্বয়ংক্রিয় স্কেলিং
   - ন্যূনতম সহ যা ব্যবহার করবেন তার জন্য মূল্য পরিশোধ
   - পরিবর্তনশীল কাজের চাপের জন্য ভালো

3. **সার্ভারলেস**
   - প্রতি-অনুরোধে মূল্য পরিশোধ
   - কোনো প্রভিশনড থ্রুপুট নেই
   - ডেভেলপমেন্ট এবং অনিয়মিত কাজের চাপের জন্য আদর্শ

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

#### স্টোরেজ অ্যাকাউন্টের ধরন

1. **Standard_LRS** - ডেভেলপমেন্ট, অ-ক্রিটিক্যাল ডেটা
2. **Standard_GRS** - প্রোডাকশন, জিও-রিডান্ডেন্সি প্রয়োজন
3. **Premium_LRS** - উচ্চ-পারফরম্যান্স অ্যাপ্লিকেশন
4. **Premium_ZRS** - জোন রিডান্ডেন্সি সহ উচ্চ উপলব্ধতা

#### পারফরম্যান্স টিয়ার

- **স্ট্যান্ডার্ড**: সাধারণ উদ্দেশ্য, খরচ-কার্যকর
- **প্রিমিয়াম**: উচ্চ-পারফরম্যান্স, কম লেটেন্সি পরিস্থিতি

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

### ১. রিজার্ভড ক্যাপাসিটি

১-৩ বছরের জন্য রিসোর্স রিজার্ভ করে উল্লেখযোগ্য ডিসকাউন্ট পান:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### ২. রাইট-সাইজিং

ছোট SKU দিয়ে শুরু করুন এবং প্রকৃত ব্যবহার অনুযায়ী স্কেল আপ করুন:

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

### ৩. অটো-স্কেলিং কনফিগারেশন

খরচ অপ্টিমাইজ করতে বুদ্ধিমত্তার সাথে স্কেলিং বাস্তবায়ন করুন:

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

### ৪. নির্ধারিত স্কেলিং

অফ-আওয়ার সময় স্কেল ডাউন করুন:

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

## পারফরম্যান্স বিবেচনা

### বেসলাইন পারফরম্যান্স প্রয়োজনীয়তা

SKU নির্বাচন করার আগে স্পষ্ট পারফরম্যান্স প্রয়োজনীয়তা নির্ধারণ করুন:

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

পারফরম্যান্স যাচাই করতে বিভিন্ন SKU পরীক্ষা করুন:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### মনিটরিং এবং অপ্টিমাইজেশন

ব্যাপক পর্যবেক্ষণ সেট আপ করুন:

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

### অ্যাপ সার্ভিস SKU দ্রুত রেফারেন্স

| SKU | টিয়ার | vCPU | RAM | স্টোরেজ | মূল্য পরিসর | ব্যবহার ক্ষেত্র |
|-----|-------|------|-----|---------|-------------|----------------|
| F1 | ফ্রি | শেয়ারড | ১GB | ১GB | ফ্রি | ডেভেলপমেন্ট |
| B1 | বেসিক | ১ | ১.৭৫GB | ১০GB | $ | ছোট অ্যাপ |
| S1 | স্ট্যান্ডার্ড | ১ | ১.৭৫GB | ৫০GB | $$ | প্রোডাকশন |
| P1V3 | প্রিমিয়াম V3 | ২ | ৮GB | ২৫০GB | $$$ | উচ্চ পারফরম্যান্স |
| I1V2 | আইসোলেটেড V2 | ২ | ৮GB | ১TB | $$$$ | এন্টারপ্রাইজ |

### SQL ডাটাবেস SKU দ্রুত রেফারেন্স

| SKU | টিয়ার | DTU/vCore | স্টোরেজ | মূল্য পরিসর | ব্যবহার ক্ষেত্র |
|-----|-------|-----------|---------|-------------|----------------|
| Basic | বেসিক | ৫ DTU | ২GB | $ | ডেভেলপমেন্ট |
| S2 | স্ট্যান্ডার্ড | ৫০ DTU | ২৫০GB | $$ | ছোট প্রোডাকশন |
| P2 | প্রিমিয়াম | ২৫০ DTU | ১TB | $$$ | উচ্চ পারফরম্যান্স |
| GP_Gen5_4 | জেনারেল পারপাস | ৪ vCore | ৪TB | $$$ | ব্যালেন্সড |
| BC_Gen5_8 | বিজনেস ক্রিটিক্যাল | ৮ vCore | ৪TB | $$$$ | মিশন ক্রিটিক্যাল |

### কন্টেইনার অ্যাপ SKU দ্রুত রেফারেন্স

| মডেল | মূল্য নির্ধারণ | CPU/মেমরি | ব্যবহার ক্ষেত্র |
|-------|---------------|------------|----------------|
| কনজাম্পশন | প্রতি-ব্যবহার | ০.২৫-২ vCPU | ডেভেলপমেন্ট, পরিবর্তনশীল লোড |
| ডেডিকেটেড D4 | রিজার্ভড | ৪ vCPU, ১৬GB | প্রোডাকশন |
| ডেডিকেটেড D8 | রিজার্ভড | ৮ vCPU, ৩২GB | উচ্চ পারফরম্যান্স |

---

## যাচাইকরণ টুল

### SKU উপলব্ধতা চেকার

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

### খরচ অনুমান স্ক্রিপ্ট

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

### পারফরম্যান্স যাচাইকরণ

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

## সেরা অনুশীলনের সারাংশ

### করণীয়

1. **ছোট দিয়ে শুরু করুন এবং প্রকৃত ব্যবহার অনুযায়ী স্কেল আপ করুন**
2. **ভিন্ন পরিবেশের জন্য ভিন্ন SKU ব্যবহার করুন**
3. **পারফরম্যান্স এবং খরচ ক্রমাগত পর্যবেক্ষণ করুন**
4. **প্রোডাকশন কাজের চাপের জন্য রিজার্ভড ক্যাপাসিটি ব্যবহার করুন**
5. **যেখানে প্রয়োজন সেখানে অটো-স্কেলিং বাস্তবায়ন করুন**
6. **বাস্তবসম্মত কাজের চাপ দিয়ে পারফরম্যান্স পরীক্ষা করুন**
7. **বৃদ্ধির পরিকল্পনা করুন কিন্তু অতিরিক্ত প্রভিশনিং এড়িয়ে চলুন**
8. **সম্ভব হলে ডেভেলপমেন্টের জন্য ফ্রি টিয়ার ব্যবহার করুন**

### করণীয় নয়

1. **ডেভেলপমেন্টের জন্য প্রোডাকশন SKU ব্যবহার করবেন না**
2. **আঞ্চলিক SKU উপলব্ধতা উপেক্ষা করবেন না**
3. **ডেটা ট্রান্সফার খরচ ভুলে যাবেন না**
4. **যথাযথ কারণ ছাড়া অতিরিক্ত প্রভিশন করবেন না**
5. **নির্ভরশীলতার প্রভাব উপেক্ষা করবেন না**
6. **অটো-স্কেলিং সীমা খুব বেশি সেট করবেন না**
7. **কমপ্লায়েন্স প্রয়োজনীয়তা ভুলে যাবেন না**
8. **শুধুমাত্র মূল্যের উপর ভিত্তি করে সিদ্ধান্ত নেবেন না**

---

**প্রো টিপ**: Azure Cost Management এবং Advisor ব্যবহার করে আপনার SKU নির্বাচন অপ্টিমাইজ করার জন্য ব্যক্তিগতকৃত সুপারিশ পান।

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [Capacity Planning](capacity-planning.md)
- **পরবর্তী পাঠ**: [Preflight Checks](preflight-checks.md)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসম্ভব সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।