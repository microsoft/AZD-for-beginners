# SKU নির্বাচন নির্দেশিকা - সঠিক Azure সার্ভিস স্তর নির্বাচন

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৬ - প্রি-ডিপ্লয়মেন্ট যাচাই ও পরিকল্পনা
- **⬅️ পূর্ববর্তী**: [ক্ষমতা পরিকল্পনা](capacity-planning.md)
- **➡️ পরবর্তী**: [প্রি-ফ্লাইট চেক](preflight-checks.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৭: সমস্যা নির্ণয়](../chapter-07-troubleshooting/common-issues.md)

## পরিচিতি

এই বিস্তৃত নির্দেশিকা আপনাকে বিভিন্ন পরিবেশ, ওয়ার্কলোড এবং প্রয়োজন অনুযায়ী সর্বোত্তম Azure সার্ভিস SKU (স্টক কিপিং ইউনিট) নির্বাচন করতে সাহায্য করে। আপনার Azure Developer CLI ডিপ্লয়মেন্টগুলির জন্য সর্বোত্তম সার্ভিস স্তর নির্বাচন করতে কার্যক্ষমতা চাহিদা, খরচ বিবেচনা এবং স্কেলেবিলিটি চাহিদাগুলি বিশ্লেষণ শিখুন।

## শেখার লক্ষ্যসমূহ

এই নির্দেশিকা সম্পন্ন করে আপনি:
- Azure SKU ধারণা, মূল্য নির্ধারণ মডেল এবং বৈশিষ্ট্য পার্থক্য বুঝতে পারবেন
- উন্নয়ন, স্টেজিং, এবং প্রোডাকশন জন্য পরিবেশ-নির্দিষ্ট SKU নির্বাচন কৌশল আয়ত্ত করবেন
- ওয়ার্কলোডের চাহিদাগুলো বিশ্লেষণ করে সেগুলোকে উপযুক্ত সার্ভিস স্তরে মানানসই করবেন
- বুদ্ধিমান SKU নির্বাচন দ্বারা খরচ অপ্টিমাইজেশন কৌশল প্রয়োগ করবেন
- SKU পছন্দের জন্য কার্যক্ষমতা পরিক্ষা ও যাচাই প্রযুক্তি প্রয়োগ করবেন
- স্বয়ংক্রিয় SKU সুপারিশ এবং মনিটরিং কনফিগার করবেন

## শেখার ফলাফল

শেষ করলে আপনি সক্ষম হবেন:
- ওয়ার্কলোড প্রয়োজনীয়তা এবং সীমাবদ্ধতার উপর ভিত্তি করে উপযুক্ত Azure সার্ভিস SKU নির্বাচন করা
- যথাযথ স্তর নির্বাচনসহ খরচ-কার্যকর বহু-পরিবেশ স্থাপত্য ডিজাইন করা
- SKU পছন্দের জন্য কার্যক্ষমতা পারফরম্যান্স বেন্চমার্কিং এবং যাচাই প্রয়োগ করা
- SKU সুপারিশ ও খরচ অপ্টিমাইজেশনের জন্য স্বয়ংক্রিয় সরঞ্জাম তৈরি করা
- পরিবর্তনশীল চাহিদার জন্য SKU মাইগ্রেশন এবং স্কেলিং কৌশল পরিকল্পনা করা
- সার্ভিস স্তর নির্বাচনে Azure ওয়েল-আর্কিটেক্ট ফ্রেমওয়ার্ক নীতিমালা প্রয়োগ করা

## বিষয়সূচি

- [SKU বোঝা](#understanding-skus)
- [পরিবেশ-ভিত্তিক নির্বাচন](#environment-based-selection)
- [সার্ভিস-নির্দিষ্ট নির্দেশিকা](#service-specific-guidelines)
- [খরচ অপ্টিমাইজেশন কৌশল](#cost-optimization-strategies)
- [কার্যক্ষমতা বিবেচনা](#performance-considerations)
- [দ্রুত উল্লেখ টেবিল](#quick-reference-tables)
- [যাচাই সরঞ্জাম](#validation-tools)

---

## SKU বোঝা

> **উদাহরণ স্কোপ:** নিচের YAML SKU ম্যাপ এবং কর্মক্ষমতা কনফিগারেশনগুলি ডিজাইন নোট, একটি `azure.yaml` স্কিমা বা লোড-টুল কনফিগারেশন নয়। Bicep ব্লক বিকল্প/টুকরো: তাদের প্যারামিটার এবং প্যারেন্ট রিসোর্স ঘোষণা করুন, একত্রিত করার সময় অনন্য প্রতীকী নাম ব্যবহার করুন এবং কার্যকর প্রোজেক্টে মডিউল সংযুক্ত করুন। দামের, সীমা এবং অঞ্চল/SKU প্রাপ্যতা আপনার সাবস্ক্রিপশনের জন্য ডিপ্লয়মেন্টের আগে যাচাই করতে হবে।

### SKU কী?

SKU (স্টক কিপিং ইউনিট) গুলি Azure রিসোর্সের জন্য বিভিন্ন সার্ভিস স্তর এবং কর্মক্ষমতা স্তর উপস্থাপন করে। প্রতিটি SKU প্রদান করে ভিন্ন:

- **কার্যক্ষমতা বৈশিষ্ট্য** (CPU, মেমরি, থ্রুপুট)
- **বৈশিষ্ট্য প্রাপ্যতা** (স্কেলিং অপশন, SLA স্তর)
- **মূল্য নির্ধারণ মডেল** (ব্যবহার-ভিত্তিক, রিজার্ভড ক্যাপাসিটি)
- **আঞ্চলিক প্রাপ্যতা** (সব অঞ্চলেই সব SKU পাওয়া যায় না)

### SKU নির্বাচনের প্রধান কারণসমূহ

1. **ওয়ার্কলোড চাহিদা**
   - প্রত্যাশিত ট্রাফিক/লোড নিদর্শন
   - কার্যক্ষমতা প্রয়োজনীয়তা (CPU, মেমরি, I/O)
   - স্টোরেজ প্রয়োজন ও অ্যাক্সেস নিদর্শন

2. **পরিবেশের ধরন**
   - উন্নয়ন/পরীক্ষণ বনাম প্রোডাকশন
   - প্রাপ্যতা চাহিদা
   - নিরাপত্তা এবং সম্মতি প্রয়োজন

3. **বাজেট সীমাবদ্ধতা**
   - প্রাথমিক খরচ বনাম পরিচালন খরচ
   - রিজার্ভড ক capacity ছাড়
   - অটো-স্কেলিং এর খরচ প্রভাব

4. **বৃদ্ধির অনুভাব**
   - স্কেলেবিলিটি চাহিদা
   - ভবিষ্যতের বৈশিষ্ট্য প্রয়োজন
   - মাইগ্রেশন জটিলতা

---

## পরিবেশ-ভিত্তিক নির্বাচন

### উন্নয়ন পরিবেশ

**গুরুত্ব**: খরচ অপ্টিমাইজেশন, মৌলিক কার্যকারিতা, সহজ প্রোভিশনিং/ডি-প্রোভিশনিং

#### সুপারিশকৃত SKU
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

#### বৈশিষ্ট্যসমূহ
- **অ্যাপ সার্ভিস**: সহজ পরীক্ষার জন্য F1 (ফ্রি) বা B1 (বেসিক)
- **ডেটাবেস**: সর্বনিম্ন সম্পদসহ বেসিক স্তর
- **স্টোরেজ**: শুধুমাত্র লোকাল রিডান্ডেন্সি সহ স্ট্যান্ডার্ড
- **কম্পিউট**: ভাগ করা সম্পদ গ্রহণযোগ্য
- **নেটওয়ার্কিং**: বেসিক কনফিগারেশন

### স্টেজিং/পরীক্ষণ পরিবেশ

**গুরুত্ব**: প্রোডাকশন সদৃশ কনফিগারেশন, খরচ ভারসাম্য, কার্যক্ষমতা পরীক্ষার সক্ষমতা

#### সুপারিশকৃত SKU
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
- **কার্যক্ষমতা**: প্রোডাকশনের ৭০-৮০%
- **বৈশিষ্ট্য**: প্রোডাকশনের অধিকাংশ বৈশিষ্ট্য সক্রিয়
- **রিডান্ডেন্সি**: কিছু ভৌগোলিক রিডান্ডেন্সি
- **স্কেলিং**: পরীক্ষার জন্য সীমিত অটো-স্কেলিং
- **মনিটরিং**: পূর্ণ মনিটরিং সিস্টেম

### প্রোডাকশন পরিবেশ

**গুরুত্ব**: কর্মক্ষমতা, প্রাপ্যতা, নিরাপত্তা, সম্মতি, স্কেলেবিলিটি

#### সুপারিশকৃত SKU
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

#### বৈশিষ্ট্যসমূহ
- **উচ্চ প্রাপ্যতা**: ৯৯.৯%+ SLA প্রয়োজনীয়তা
- **কার্যক্ষমতা**: নিবেদিত সম্পদ, উচ্চ থ্রুপুট
- **নিরাপত্তা**: প্রিমিয়াম নিরাপত্তা বৈশিষ্ট্য
- **স্কেলিং**: পূর্ণ অটো-স্কেলিং সক্ষমতা
- **মনিটরিং**: ব্যাপক পর্যবেক্ষণ

---

## সার্ভিস-নির্দিষ্ট নির্দেশিকা

### Azure অ্যাপ সার্ভিস

#### SKU সিদ্ধান্ত ম্যাট্রিক্স

| ব্যবহার ক্ষেত্র | সুপারিশকৃত SKU | যুক্তি |
|----------|----------------|-----------|
| উন্নয়ন/পরীক্ষণ | F1 (ফ্রি) বা B1 (বেসিক) | খরচ-কার্যকর, পরীক্ষার জন্য যথেষ্ট |
| ছোট প্রোডাকশন অ্যাপ | S1 (স্ট্যান্ডার্ড) | কাস্টম ডোমেইন, SSL, অটো-স্কেলিং |
| মাঝারি প্রোডাকশন অ্যাপ | P1V3 (প্রিমিয়াম V3) | উন্নত কর্মক্ষমতা, আরো বৈশিষ্ট্য |
| উচ্চ-ট্রাফিক অ্যাপ | P2V3 বা P3V3 | নিবেদিত সম্পদ, উচ্চ কর্মক্ষমতা |
| মিশন-ক্রিটিক্যাল অ্যাপ | I1V2 (আইসোলেটেড V2) | নেটওয়ার্ক বিচ্ছিন্নতা, নিবেদিত হার্ডওয়্যার |

#### কনফিগারেশন উদাহরণ

**উন্নয়ন**
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

### Azure SQL ডেটাবেস

#### SKU নির্বাচন কাঠামো

1. **DTU-ভিত্তিক (ডেটাবেস ট্রানজেকশন ইউনিট)**
   - **বেসিক**: ৫ DTU - উন্নয়ন/পরীক্ষণ
   - **স্ট্যান্ডার্ড**: S0-S12 (১০-৩০০০ DTU) - সাধারণ উদ্দেশ্য
   - **প্রিমিয়াম**: P1-P15 (১২৫-৪০০০ DTU) - কর্মক্ষমতা-সংক্রান্ত

2. **vCore-ভিত্তিক** (প্রোডাকশনের জন্য সুপারিশকৃত)
   - **সাধারণ উদ্দেশ্য**: ভারসাম্যপূর্ণ কম্পিউট ও স্টোরেজ
   - **ব্যবসায়িক গুরুত্বপূর্ণ**: কম বিলম্ব, উচ্চ IOPS
   - **হাইপারস্কেল**: অত্যন্ত স্কেলেবল স্টোরেজ; বর্তমান সাইজ সীমা এবং আঞ্চলিক সমর্থন যাচাই করুন

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

### Azure কন্টেইনার অ্যাপস

#### পরিবেশের ধরন

1. **ভোগ-বিশ্লেষণ-ভিত্তিক**
   - ব্যবহার অনুযায়ী পরিশোধ
   - উন্নয়ন ও পরিবর্তনশীল ওয়ার্কলোডের জন্য উপযুক্ত
   - ভাগ করা অবকাঠামো

2. **নির্দিষ্ট (ওয়ার্কলোড প্রোফাইল)**
   - নিবেদিত কম্পিউট রিসোর্স
   - পূর্বানুমানযোগ্য কর্মক্ষমতা
   - প্রোডাকশন ওয়ার্কলোডের জন্য উন্নত

#### কনফিগারেশন উদাহরণ

**উন্নয়ন (ভোগ)**
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

**প্রোডাকশন (নির্দিষ্ট)**
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

জোন রিডান্ডেন্সি জন্য সমর্থিত অঞ্চল অবকাঠামো এবং উপযুক্ত VNet/subnet কনফিগারেশন প্রয়োজন, যা এখানে বাদ দেওয়া হয়েছে। এই উদাহরণটি তিনটি নির্দিষ্ট নোড বাজেট করে; জোন ব্যর্থতার জন্য কমপক্ষে দুই অ্যাপ রেপ্লিকা ক্রস-জোন বিতরণের জন্য কনফিগার করুন এবং রেপ্লিকা ও নোডের সাইজ ঠিক করুন। দেখুন [Container Apps নির্ভরযোগ্যতা নির্দেশিকা](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps)। কোনো অ্যাপ এই প্রোফাইলে রাখার জন্য তার `workloadProfileName: 'production-profile'` সেট করুন; শুধুমাত্র প্রোফাইল তৈরি করাটা অ্যাপ স্থানান্তর করে না।

### Azure Cosmos DB

#### থ্রুপুট মডেল

1. **ম্যানুয়াল প্রোভিশন্ড থ্রুপুট**
   - পূর্বনির্ধারিত কর্মক্ষমতা
   - রিজার্ভড ক capacity ছাড়
   - স্থিতিশীল ওয়ার্কলোডের জন্য আদর্শ

2. **অটোস্কেল প্রোভিশন্ড থ্রুপুট**
   - ব্যবহার অনুযায়ী স্বয়ংক্রিয় স্কেলিং
   - আপনি যত ব্যবহার করবেন ততই পরিশোধ (নূন্যতম সহ)
   - পরিবর্তনশীল ওয়ার্কলোডের জন্য ভাল

3. **সার্ভারলেস**
   - অনুরোধ অনুযায়ী পরিশোধ
   - কোনো প্রোভিশন্ড থ্রুপুট নেই
   - উন্নয়ন ও অন্তর্বর্তী ওয়ার্কলোডের জন্য উপযুক্ত

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

### Azure স্টোরেজ অ্যাকাউন্ট

#### স্টোরেজ অ্যাকাউন্টের ধরন

1. **Standard_LRS** - উন্নয়ন, অপ্রয়োজনীয় ডেটা
2. **Standard_GRS** - প্রোডাকশন, জিও-রিডান্ডেন্সি দরকার
3. **Premium_LRS** - উচ্চ কর্মক্ষমতার অ্যাপ্লিকেশন
4. **Premium_ZRS** - জোন রিডান্ডেন্সি সহ উচ্চ প্রাপ্যতা

#### কর্মক্ষমতা স্তর

- **স্ট্যান্ডার্ড**: সাধারণ উদ্দেশ্য, খরচ-কার্যকর
- **প্রিমিয়াম**: উচ্চ কর্মক্ষমতা, কম বিলম্ব পরিস্থিতি

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

### ১. রিজার্ভড ক capacity

উল্লেখযোগ্য ছাড়ের জন্য ১-৩ বছরের জন্য রিসোর্স সংরক্ষণ করুন:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

রিজার্ভেশন অফার এবং যোগ্য রিসোর্সের ধরন ভিন্ন হতে পারে; প্রতিটি সার্ভিস/SKU রিজার্ভেশন সমর্থন করে ধরে নেবেন না, ক্যাটালগ ও ক্রয় শর্ত পরীক্ষা করুন।

### ২. সঠিক মাপ নির্বাচন

ছোট SKU থেকে শুরু করে বাস্তব ব্যবহার অনুযায়ী স্কেল করুন:

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

খরচ অপ্টিমাইজেশনের জন্য বুদ্ধিমান স্কেলিং প্রয়োগ করুন:

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

### ৪. নির্ধারিত স্কেলিং

অফ-আওয়ারে স্কেল-ডাউন করুন:

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

## কর্মক্ষমতা বিবেচনা

### বেসলাইন কর্মক্ষমতা প্রয়োজনীয়তা

SKU নির্বাচনের আগে স্পষ্ট কর্মক্ষমতা প্রয়োজন নির্ধারণ করুন:

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

কর্মক্ষমতা যাচাইয়ের জন্য বিভিন্ন SKU পরীক্ষা করুন:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### মনিটরিং এবং অপ্টিমাইজেশন

ব্যাপক মনিটরিং সেট আপ করুন:

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

## দ্রুত উল্লেখযোগ্য টেবিল

### অ্যাপ সার্ভিস SKU দ্রুত উল্লেখ

| SKU | স্তর | vCPU | র‍্যাম | স্টোরেজ | মূল্য পরিসীমা | ব্যবহার ক্ষেত্র |
|-----|------|------|-----|---------|-------------|----------|
| F1 | ফ্রি | শেয়ার্ড | ১জিবি | ১জিবি | ফ্রি | উন্নয়ন |
| B1 | বেসিক | ১ | ১.৭৫জিবি | ১০জিবি | $ | ছোট অ্যাপ |
| S1 | স্ট্যান্ডার্ড | ১ | ১.৭৫জিবি | ৫০জিবি | $$ | প্রোডাকশন |
| P1V3 | প্রিমিয়াম V3 | ২ | ৮জিবি | ২৫০জিবি | $$$ | উচ্চ কর্মক্ষমতা |
| I1V2 | আইসোলেটেড V2 | ২ | ৮জিবি | ১টিবি | $$$$ | এন্টারপ্রাইজ |

### SQL ডাটাবেস SKU দ্রুত উল্লেখ

| SKU | স্তর | DTU/vCore | স্টোরেজ | মূল্য পরিসীমা | ব্যবহার ক্ষেত্র |
|-----|------|-----------|---------|-------------|----------|
| Basic | বেসিক | ৫ DTU | ২জিবি | $ | উন্নয়ন |
| S2 | স্ট্যান্ডার্ড | ৫০ DTU | ২৫০জিবি | $$ | ছোট প্রোডাকশন |
| P2 | প্রিমিয়াম | ২৫০ DTU | ১টিবি | $$$ | উচ্চ কর্মক্ষমতা |
| GP_Gen5_4 | সাধারণ উদ্দেশ্য | ৪ vCore | ৪টিবি | $$$ | ভারসাম্যপূর্ণ |
| BC_Gen5_8 | ব্যবসায়িক গুরুত্বপূর্ণ | ৮ vCore | ৪টিবি | $$$$ | মিশন-ক্রিটিক্যাল |

### কন্টেনার অ্যাপস SKU দ্রুত উল্লেখ

| মডেল | মূল্য নির্ধারণ | CPU/মেমরি | ব্যবহার ক্ষেত্র |
|-------|---------|------------|----------|
| ভোগ-বিশ্লেষণ | ব্যবহার অনুযায়ী পরিশোধ | পরিবেশ/প্রোফাইল অনুযায়ী সমর্থিত CPU/মেমরি কম্বিনেশন | উন্নয়ন বা প্রোডাকশন, পরিবর্তনশীল লোড |
| নিবেদিত D4 | নিবেদীত নোড বিলিং | ৪ vCPU, ১৬GiB প্রতি নোড | ধারাবাহিক লোড/বিচ্ছিন্নতার প্রয়োজন |
| নিবেদিত D8 | নিবেদীত নোড বিলিং | ৮ vCPU, ৩২GiB প্রতি নোড | উচ্চ ধারাবাহিক লোড |

---

## যাচাই সরঞ্জাম

### SKU প্রাপ্যতা চেকার

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

### খরচ অনুমান স্ক্রিপ্ট

**পিসুডোকোড মাত্র:** নিচের `Get-ResourceCost` একটি প্রকল্প-নির্দিষ্ট ফাংশন যা আপনাকে বর্তমান আঞ্চলিক/চুক্তিভিত্তিক মূল্য নির্ধারণ এবং ব্যবহারের অনুমান ব্যবহার করে প্রয়োগ করতে হবে। এটি কোনো PowerShell বা Azure কমান্ডলেট নয়।

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

### কর্মক্ষমতা যাচাই

নিচের YAML চাহিদা স্কেচ, **না** Azure Load Testing, JMeter, Locust বা k6 ইনপুট স্কিমা। প্রতিটি প্রয়োগের আগে এটি আপনার পছন্দের সরঞ্জামের বাস্তব কনফিগারেশনে রূপান্তর করুন।

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

## সেরা প্র্যাকটিস সারাংশ

### করণীয়

১. **ছোট থেকে শুরু করে ব্যবহার অনুযায়ী স্কেল করুন**
২. **বিভিন্ন পরিবেশের জন্য বিভিন্ন SKU ব্যবহার করুন**
৩. **কার্যক্ষমতা এবং খরচ নিয়মিত মনিটর করুন**
৪. **প্রোডাকশন ওয়ার্কলোডের জন্য রিজার্ভড ক্যাপাসিটি ব্যবহার করুন**
৫. **যেখানে প্রয়োজন সেখানে অটো-স্কেলিং কার্যকর করুন**
৬. **বাস্তবসম্মত ওয়ার্কলোড দিয়ে পারফরম্যান্স পরীক্ষা করুন**
৭. **বৃদ্ধির পরিকল্পনা করুন কিন্তু অতিরিক্ত প্রোভিশনিং থেকে বিরত থাকুন**
৮. **উন্নয়নের জন্য সম্ভব হলে ফ্রি স্তর ব্যবহার করুন**

### এড়িয়ে চলার বিষয়

১. **উন্নয়নের জন্য প্রোডাকশন SKU ব্যবহার করবেন না**
২. **আঞ্চলিক SKU প্রাপ্যতা উপেক্ষা করবেন না**
৩. **ডেটা ট্রান্সফার খরচ ভুলে যাবেন না**
৪. **যথাযথ কারণ ছাড়া অতিরিক্ত প্রোভিশন করবেন না**
৫. **ডিপেন্ডেন্সির প্রভাব উপেক্ষা করবেন না**
৬. **অটো-স্কেলিং এর সীমা খুব বেশি নির্ধারণ করবেন না**
৭. **কমপ্লায়েন্স প্রয়োজনীয়তা ভুলে যাবেন না**
৮. **শুধুমাত্র দাম দেখে সিদ্ধান্ত নিবেন না**

---

**প্রো টিপ**: Azure Cost Management এবং Advisor ব্যবহার করে আপনার ব্যবহারিক প্যাটার্নের ভিত্তিতে SKU নির্বাচনের জন্য ব্যক্তিগত সুপারিশ পান।

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [ক্ষমতা পরিকল্পনা](capacity-planning.md)
- **পরবর্তী পাঠ**: [প্রি-ফ্লাইট চেক](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->