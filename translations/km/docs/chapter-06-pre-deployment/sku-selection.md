# មគ្គុទ្ទេសក៍ជ្រើសរើស SKU - ការជ្រើសរើសជំហានសេវាកម្ម Azure ដែលត្រឹមត្រូវ

**ការរុករកជំពូក៖**
- **📚 ទំព័រដើមវគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្នក្នុងការអាន**: ជំពូក 6 - ការទប់ស្កាត់ និងផែនការមុនការចាប់ផ្តើមដំណើរការ
- **⬅️ មុននេះ**: [ការធ្វើផែនការថាមពល](capacity-planning.md)
- **➡️ បន្ទាប់**: [ការត្រួតពិនិត្យមុនការហោះហើរ](preflight-checks.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 7: ការដោះស្រាយបញ្ហា](../chapter-07-troubleshooting/common-issues.md)

## ការណែនាំ

មគ្គុទ្ទេសក៍ទូលំទូលាយនេះជួយអ្នកក្នុងការជ្រើសរើស SKU សេវាកម្ម Azure ល្អបំផុតសម្រាប់បរិស្ថាន ផ្នែកការងារ និងតម្រូវការផ្សេងៗ។ រៀនវិភាគតម្រូវការសមត្ថភាព ការពិចារណាអំពីថ្លៃ និងតម្រូវការចំនួសដើម្បីជ្រើសរើសជំហានសេវាកម្មដែលសមស្របបំផុតសម្រាប់ការចាប់ផ្តើមប្រើប្រាស់ Azure Developer CLI របស់អ្នក។

## គោលបំណងរៀន

ដោយបញ្ចប់មគ្គុទ្ទេសក៍នេះ អ្នកនឹងអាច៖
- យល់ដឹងអំពីគំនិត SKU របស់ Azure រចនាប្បទាណថ្លៃ និងភាពខុសគ្នានៃមុខងារ
- ជំនាញក្នុងរបៀបជ្រើសរើស SKU លើបរិស្ថានជាក់លាក់សម្រាប់ការអភិវឌ្ឍ ការសាកល្បង និងផលិតកម្ម
- វិភាគតម្រូវការផ្នែកការងារ ហើយផ្គូផ្គងវាជាមួយជំហានសេវាកម្មសមរម្យ
- អនុវត្តយុទ្ធសាស្ត្រកាត់បន្ថយថ្លៃតាមរយៈការជ្រើសរើស SKU ប្រញាប់ប្រាជ្ញា
- ប្រើប្រាស់វិធីសាស្ត្រសាកល្បង និងផ្ទៀងផ្ទាត់សមត្ថភាពសម្រាប់ជ្រើសរើស SKU
- កំណត់ការផ្គួរផ្គងអេតិចសហ SKU ដោយស្វ័យប្រវត្តិ និងការត្រួតពិនិត្យ

## លទ្ធផលរៀនបាន

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច៖
- ជ្រើសរើស SKU សេវាកម្ម Azure ដែលសមរម្យផ្អែកលើតម្រូវការផ្នែកការងារ និងកំណត់កម្រ
- កំណត់រចនាសម្ព័ន្ធមួយដែលមានថ្លៃតិចសម្រាប់បរិស្ថានច្រើនជាមួយជំហានត្រឹមត្រូវ
- ប្រើប្រាស់វិធានសាកល្បង និងផ្ទៀងផ្ទាត់សមត្ថភាពសម្រាប់ជ្រើសរើស SKU
- បង្កើតឧបករណ៍អូតូម៉ាទិចសម្រាប់ណែនាំ SKU និងកាត់បន្ថយថ្លៃ
- រៀបចំផែនការផ្លាស់ទី SKU និងយុទ្ធសាស្ត្រជំនាញលំដាប់កំរិតសម្រាប់តម្រូវការផ្លាស់ប្តូរ
- អនុវត្តគោលការណ៍ Azure Well-Architected Framework សម្រាប់ជ្រើសរើសជំហានសេវាកម្ម

## បញ្ជីមាតិកា

- [ការយល់ដឹងអំពី SKU](#ការយល់ដឹងអំពី-sku)
- [ការជ្រើសរើសផ្អែកលើបរិស្ថាន](#ការជ្រើសរើសផ្អែកលើបរិស្ថាន)
- [គោលការណ៍ជាក់លាក់សម្រាប់សេវាកម្ម](#គោលការណ៍ជាក់លាក់សម្រាប់សេវាកម្ម)
- [យុទ្ធសាស្ត្រកាត់បន្ថយថ្លៃ](#codeblock9)
- [ការពិចារណាអំពីសមត្ថភាព](#4-ការចំណុះតាមកាលវិភាគ)
- [តារាងយោងរហ័ស](#ការសាកល្បងផ្ទុក)
- [ឧបករណ៍ផ្ទៀងផ្ទាត់](#តារាងយោង-sku-app-service-រហ័ស)

---

## ការយល់ដឹងអំពី SKU

### SKU ជាអ្វី?

SKU (Stock Keeping Units) គឺតំណាងឲ្យជំហានសេវាកម្មនិងកម្រិតសមត្ថភាពនានាសម្រាប់ធនធាន Azure។ រាល់ SKU ផ្ដល់ជូននូវ:

- **លក្ខណៈសមត្ថភាព** (CPU, អង្គចងចាំ, ផ្លូវចេញចូល)
- **ការចូលប្រើមុខងារ** (ជម្រើសចំណុះ, កម្រិត SLA)
- **គំរូតម្លៃ** (ផ្អែកលើការបរិច្ឆេទ ប្រើបរិមាណកំណត់)
- **ការចូលប្រើតំបន់** (មិនមែនរាល់ SKU មាននៅគ្រប់តំបន់ទាំងអស់)

### ហេតុផលសំខាន់ក្នុងការជ្រើសរើស SKU

1. **តម្រូវការផ្នែកការងារ**
   - លំនាំចរាចរណ៍/ផែនការការផ្ទុកទុនដែលរំពឹងទុក
   - តម្រូវការសមត្ថភាព (CPU, អង្គចងចាំ, I/O)
   - តម្រូវការផ្ទុក និងលំនាំការចូលប្រើ

2. **ប្រភេទបរិស្ថាន**
   - ការអភិវឌ្ឍ/សាកល្បង បន្ទាប់បន្សំជាមួយផលិតកម្ម
   - តម្រូវការចូលប្រើ
   - តម្រូវការសន្តិសុខ និងគោលការណ៍

3. **ការកំណត់ថវិការ**
   - ថ្លៃដើម និងថ្លៃប្រតិបត្តិការ
   - ការបញ្ចុះតម្លៃកំណត់ថាមពល
   - ការប៉ាន់ប្រមាណថ្លៃចំណាយសម្រាប់ការ auto-scaling

4. **ការប៉ាន់ប្រមាណការលូតលាស់**
   - តម្រូវការចំណុះ
   - បន្ថែមមុខងារពេលអនាគត
   - ភាពស្មុគស្មាញនៃការផ្លាស់ទី

---

## ការជ្រើសរើសផ្អែកលើបរិស្ថាន

### បរិស្ថានអភិវឌ្ឍ

**អាទិភាព**៖ ការកាត់បន្ថយថ្លៃ ការប្រតិបត្តិមូលដ្ឋាន ការទុកចិត្តបានសម្រាប់ការតំឡើង/ដកចេញងាយស្រួល

#### SKU ត្រូវបានណែនាំ
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

#### លក្ខណៈលម្អិត
- **App Service**: F1 (ឥតគិតថ្លៃ) ឬ B1 (មូលដ្ឋាន) សម្រាប់ការសាកល្បងសាមញ្ញ
- **Database**: ជំហានមូលដ្ឋាន មានធនធានតិចតួច
- **Storage**: ស្តង់ដាជាមួយការបញ្ជាក់ទីតាំងក្នុងតំបន់តែប៉ុណ្ណោះ
- **Compute**: ធនធានចែករំលែកអាចទទួលយកបាន
- **Networking**: ការកំណត់ថ្នាក់មូលដ្ឋាន

### បរិស្ថានសាកល្បង/សាកសួរ

**អាទិភាព**៖ ការកំណត់ដែលដូចផលិតកម្ម ការតុល្យភាពថ្លៃ ការសាកល្បងសមត្ថភាព

#### SKU ត្រូវបានណែនាំ
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

#### លក្ខណៈលម្អិត
- **សមត្ថភាព**: 70-80% នៃថាមពលផលិតកម្ម
- **មុខងារ**: អនុញ្ញាតនូវមុខងារផលិតកម្មភាគច្រើន
- **ការបញ្ជាក់ទីតាំង**: មានការកំណត់ទីតាំងខ្លះៗ
- **ចំណុះ**: តម្រូវអត្រាផ្លាស់ប្តូរ ដើម្បីសាកល្បងបានតិចតួច
- **ការត្រួតពិនិត្យ**: អង្កេតទាំងស្រុង

### បរិស្ថានផលិតកម្ម

**អាទិភាព**៖ សមត្ថភាព ការចូលប្រើ សន្តិសុខ គោលការណ៍ និងការចំណុះ

#### SKU ត្រូវបានណែនាំ
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

#### លក្ខណៈលម្អិត
- **ការចូលប្រើខ្ពស់**: គោលការណ៍ SLA 99.9%+ ត្រូវបានទាក់ទាញ
- **សមត្ថភាព**: ធនធានឯកជន ផ្លូវចេញចូលខ្ពស់
- **សន្តិសុខ**: មុខងារសន្តិសុខថ្នាក់ខ្ពស់
- **ចំណុះ**: មានមុខងារចំណុះដោយស្វ័យប្រវត្តិសំរាប់ពេញលេញ
- **ការត្រួតពិនិត្យ**: មានប្រព័ន្ធអង្កេតទាំងស្រុង

---

## គោលការណ៍ជាក់លាក់សម្រាប់សេវាកម្ម

### Azure App Service

#### តារាងសម្រេចចិត្ត SKU

| ករណីប្រើប្រាស់ | SKU ត្រូវបានណែនាំ | មូលហេតុ |
|----------|----------------|-----------|
| ការអភិវឌ្ឍ/សាកល្បង | F1 (ឥតគិតថ្លៃ) ឬ B1 (មូលដ្ឋាន) | ថ្លៃសមរម្យ សមស្របសម្រាប់សាកល្បង |
| កម្មវិធីផលិតកម្មតូច | S1 (ស្តង់ដា) | ដែនខ្លួន ឯកសារ SSL, auto-scaling |
| កម្មវិធីផលិតកម្មមធ្យម | P1V3 (ព្រីមៀម V3) | សមត្ថភាពល្អជាង មុខងារច្រើនជាង |
| កម្មវិធីមានចរាចរណ៍ខ្ពស់ | P2V3 ឬ P3V3 | ធនធានឯកជន សមត្ថភាពខ្ពស់ |
| កម្មវិធីសំខាន់ក្នុងបេសកកម្ម | I1V2 (ផ្សែងបុរេប្រវត្ត V2) | ដាច់បែកបណ្តាញ ឧបករណ៍ឯកជន |

#### ឧទាហរណ៍បច្ចុប្បន្នភាព

**ការអភិវឌ្ឍ**
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

**ផលិតកម្ម**
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

#### រចនាសម្ព័ន្ធជ្រើសរើស SKU

1. **ផ្អែកលើ DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - ការអភិវឌ្ឍ/សាកល្បង
   - **Standard**: S0-S12 (10-3000 DTU) - សំរាប់ការប្រើប្រាស់ទូទៅ
   - **Premium**: P1-P15 (125-4000 DTU) - មុខងារសំខាន់សម្រាប់សមត្ថភាព

2. **ផ្អែកលើ vCore** (ណែនាំសម្រាប់ផលិតកម្ម)
   - **General Purpose**: ការគ្រប់គ្រងហេដ្ឋារចនាសម្ព័ន្ធ និងផ្ទុកទិន្នន័យតុល្យភាព
   - **Business Critical**: បញ្ចុះពេលចេញអតិភាព ខ្ពស់នៃ IOPS
   - **Hyperscale**: បណ្តេញលំនាំផ្ទុកខ្ពស់ (រហូតដល់ 100TB)

#### ឧទាហរណ៍ការកំណត់

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

#### ប្រភេទបរិស្ថាន

1. **ផ្អែកលើការប្រើប្រាស់**
   - ការទូទាត់បន្ទាប់ពីប្រើប្រាស់
   - សមរម្យសម្រាប់ការអភិវឌ្ឍ និងផ្នែកការងារទំហំប្រែប្រួល
   - ហេដ្ឋារចនាសម្ព័ន្ធចែករំលែក

2. **ឯកជន (ផ profiles ផ្នែកការងារ)**
   - ធនធានគណនេយ្យឯកជន
   - សមត្ថភាពអាចទ្រទ្រង់បាន
   - ល្អសម្រាប់ផ្នែកការងារផលិតកម្ម

#### ឧទាហរណ៍ការកំណត់

**ការអភិវឌ្ឍ (ផ្អែកលើការប្រើប្រាស់)**
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

**ផលិតកម្ម (ឯកជន)**
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

#### គំរូផ្លូវចេញចូល

1. **ផ្លូវចេញចូលដែលបានចាត់ទុកដោយដៃ**
   - សមត្ថភាពច្បាស់លាស់
   - ការបញ្ចុះតម្លៃតាមការកំណត់
   - ល្អសម្រាប់ការធ្វើការងារមានស្ថិរភាព

2. **ផ្លូវចេញចូលដែលរៀបចំដោយស្វ័យប្រវត្តិ**
   - ជម្រើសជម្រុញដោយប្រើផ្អែកលើការប្រើប្រាស់
   - ទូទាត់សម្រាប់ដែលប្រើប្រាស់ជាមួយមូលដ្ឋានអប្បបរមា
   - ល្អសម្រាប់ការងារផ្លាស់ប្តូរប្រែប្រួល

3. **Serverless**
   - ទូទាត់សម្រាប់ពាក្យស្នើរសុំ
   - គ្មានផ្លូវចេញចូលដែលបានកំណត់
   - សមរម្យសម្រាប់ការអភិវឌ្ឍ និងការងារដែលមានបដិសេធជាបណ្តោះអាសន្ន

#### ឧទាហរណ៍ SKU

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

#### ប្រភេទគណនីផ្ទុកទិន្នន័យ

1. **Standard_LRS** - ការអភិវឌ្ឍ បរិស្ថានដែលមិនសំខាន់
2. **Standard_GRS** - ផលិតកម្ម តម្រូវការចំណុះភូមិសាស្ត្រ
3. **Premium_LRS** - កម្មវិធីសមត្ថភាពខ្ពស់
4. **Premium_ZRS** - ការចូលប្រើខ្ពស់ជាមួយការចំណុះតំបន់

#### ជំហានសមត្ថភាព

- **Standard**: គោលបំណងទូទៅ តម្លៃសមរម្យ
- **Premium**: សមត្ថភាពខ្ពស់ សង្គ្រោះពេលវេលាខ្លី

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

## យុទ្ធសាស្ត្រកាត់បន្ថយថ្លៃ

### 1. ការកំណត់ថាមពលកក់

កក់ធនធានរយៈពេល 1-3 ឆ្នាំសម្រាប់ការបញ្ចុះតម្លៃចំរូង៖

```bash
# ពិនិត្យមើលជម្រើសការកក់ទុក
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. ការជម្រាស់ទំហំត្រឹមត្រូវ

ចាប់ផ្តើមដោយ SKU តូចៗ ហើយកើនឡើងជាមួយការប្រើប្រាស់ពិតប្រាកដ៖

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

### 3. ការកំណត់ Auto-Scaling

អនុវត្តការចំណុះដោយគួរឱ្យចាប់អារម្មណ៍ដើម្បីជួយកាត់បន្ថយថ្លៃ៖

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

### 4. ការចំណុះតាមកាលវិភាគ

ចំណុះចុះពេលព្រឺព្រួញ៖

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

## ការពិចារណាអំពីសមត្ថភាព

### តម្រូវការសមត្ថភាពមូលដ្ឋាន

កំណត់តម្រូវការសមត្ថភាពមុនជ្រើសរើស SKU៖

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

### ការសាកល្បងផ្ទុក

សាកល្បង SKU ផ្សេងៗដើម្បីផ្ទៀងផ្ទាត់សមត្ថភាព៖

```bash
# សេវាកម្មសាកល្បងបង្ហាញ Azure
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### ការត្រួតពិនិត្យ និងការបំប៉ន

ដាក់ប្រាក់បញ្ចូលការត្រួតពិនិត្យទាំងស្រុង៖

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

## តារាងយោងរហ័ស

### តារាងយោង SKU App Service រហ័ស

| SKU | ជំហាន | vCPU | RAM | ផ្ទុក | ចំម្រាស់តម្លៃ | ករណីប្រើប្រាស់ |
|-----|------|------|-----|---------|-------------|----------|
| F1 | ឥតគិតថ្លៃ | ចែករំលែក | 1GB | 1GB | ឥតគិតថ្លៃ | ការអភិវឌ្ឍ |
| B1 | មូលដ្ឋាន | 1 | 1.75GB | 10GB | $ | កម្មវិធីតូច |
| S1 | ស្តង់ដា | 1 | 1.75GB | 50GB | $$ | ផលិតកម្ម |
| P1V3 | ព្រីមៀម V3 | 2 | 8GB | 250GB | $$$ | សមត្ថភាពខ្ពស់ |
| I1V2 | ផ្សែងបុរេប្រវត្ត V2 | 2 | 8GB | 1TB | $$$$ | សហគ្រាស |

### តារាងយោង SKU SQL Database រហ័ស

| SKU | ជំហាន | DTU/vCore | ផ្ទុក | ចំម្រាស់តម្លៃ | ករណីប្រើប្រាស់ |
|-----|------|-----------|---------|-------------|----------|
| Basic | មូលដ្ឋាន | 5 DTU | 2GB | $ | ការអភិវឌ្ឍ |
| S2 | ស្តង់ដា | 50 DTU | 250GB | $$ | ផលិតកម្មតូច |
| P2 | ព្រីមៀម | 250 DTU | 1TB | $$$ | សមត្ថភាពខ្ពស់ |
| GP_Gen5_4 | គោលបំណងទូទៅ | 4 vCore | 4TB | $$$ | តុល្យភាព |
| BC_Gen5_8 | វិបត្តិសេចក្ដី | 8 vCore | 4TB | $$$$ | មុខងារសំខាន់ |

### តារាងយោង SKU Container Apps រហ័ស

| មូដែល | តម្លៃ | CPU/អង្គចងចាំ | ករណីប្រើប្រាស់ |
|-------|---------|------------|----------|
| Consumption | ទូទាត់តាមការប្រើប្រាស់ | 0.25-2 vCPU | ការអភិវឌ្ឍ, បន្ទុកប្រែប្រួល |
| Dedicated D4 | កំណត់ | 4 vCPU, 16GB | ផលិតកម្ម |
| Dedicated D8 | កំណត់ | 8 vCPU, 32GB | សមត្ថភាពខ្ពស់ |

---

## ឧបករណ៍ផ្ទៀងផ្ទាត់

### កម្មវិធីពិនិត្យការចូលប្រើ SKU

```bash
#!/bin/bash
# ពិនិត្យភាពមាន SKU នៅក្នុងតំបន់គោលដៅ

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

# វិធីប្រើប្រាស់
check_sku_availability "eastus" "app-service" "P1V3"
```

### ស្គ្រីបប៉ាន់ប្រមាណថ្លៃ

```powershell
# ស្គ្រីប PowerShell សម្រាប់ការប៉ាន់ស្មានតម្លៃ
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
        
        # ប្រើ API តម្លៃ Azure ឬមាឌគណនាកាត
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# ការប្រើប្រាស់
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### ការផ្ទៀងផ្ទាត់សមត្ថភាព

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

## សង្ខេបអំពីអនុវត្តន៍ល្អបំផុត

### អ្វីគួរធ្វើ

1. **ចាប់ផ្តើមតូច និងកើនឡើង** ផ្អែកលើការប្រើប្រាស់ពិតប្រាកដ
2. **ប្រើ SKU ផ្សេងគ្នាសម្រាប់បរិស្ថានផ្សេងៗ**
3. **ត្រួតពិនិត្យសមត្ថភាព និងថ្លៃជាប្រចាំ**
4. **ប្រើកំណត់ថាមពលកក់សម្រាប់ការងារផលិតកម្ម**
5. **អនុវត្តការចំណុះដោយស្វ័យប្រវត្តនៅកន្លែងត្រឹមត្រូវ**
6. **សាកល្បងសមត្ថភាពជាមួយការងារពិតប្រាកដ**
7. **ផែនការសម្រាប់ការលូតលាស់ ប៉ុន្តែមិនប្រើប្រាស់លើស**
8. **ប្រើប្រភេទឥតគិតថ្លៃសម្រាប់ការអភិវឌ្ឍនៅពេលអាចអនុវត្តបាន**

### អ្វីគួរតែងកុំធ្វើ

1. **កុំប្រើ SKU ផលិតកម្មសម្រាប់ការអភិវឌ្ឍ**
2. **កុំភ្លេចអំពីការចូលប្រើតំបន់ SKU**
3. **កុំភ្លេចថ្លៃដឹកជញ្ជូនទិន្នន័យ**
4. **កុំប្រើប្រាស់លើសដោយគ្មានហេតុផល**
5. **កុំភ្លេចអំពីផលប៉ះពាល់នៃការគាំទ្រ**
6. **កុំកំណត់ដែនកំណត់ auto-scaling ខ្ពស់ពេក**
7. **កុំភ្លេចអំពីតម្រូវការគោលការណ៍**
8. **កុំធ្វើការសម្រេចចិត្តលើមូលដ្ឋានតែតម្លៃតែមួយ**

---

**ជំនួយពិសេស**៖ ប្រើ Azure Cost Management និង Advisor ដើម្បីទទួលបានការណែនាំផ្ទាល់ខ្លួនសម្រាប់កាត់បន្ថយការជ្រើសរើស SKU របស់អ្នកផ្អែកលើលំនាំការប្រើប្រាស់ពិតប្រាកដ។

---

**ការរុករក**
- **មេរៀនមុន**: [ការធ្វើផែនការថាមពល](capacity-planning.md)
- **មេរៀនបន្ទាប់**: [ការត្រួតពិនិត្យមុនការហោះហើរ](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការព្រមាន**៖  
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ខណៈពេលដែលយើងខិតខំប្រឹងប្រែងឲ្យបានការត្រឹមត្រូវ សូមយល់ដឹងថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬការខុសប្លែក។ ឯកសារដើមជាភាសាបូរបាត់គួរត្រូវបានគេរំពឹងជាផ្នែកផ្ទាល់ខ្លួនសម្រាប់ការពិចារណាដ៏ទូលំទូលាយ។ សម្រាប់ព័ត៌មានសំខាន់ៗ ការបកប្រែដោយមនុស្សវិជ្ជាជីវៈត្រូវបានណែនាំ។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកប្រែខុសដែលកើតមានពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->