# មគ្គុទេសក៍ការជ្រើសរើស SKU - ការជ្រើសរើសថ្នាក់សេវាកម្ម Azure ត្រឹមត្រូវ

**ការរុករកជំពូក៖**
- **📚 ទំព័រផ្លូវការសម្រាប់វគ្គរៀន**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូកទី 6 - ការត្រួតពិនិត្យ និងការធ្វើផែនការមុនការដាក់បញ្ចូល
- **⬅️ មុននេះ**: [ការធ្វើផែនការទិញថាមពល](capacity-planning.md)
- **➡️ បន្ទាប់**: [ការត្រួតពិនិត្យមុននឹងហោះបិទ](preflight-checks.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 7៖ ការកែលំអររេហ្សុល](../chapter-07-troubleshooting/common-issues.md)

## អារម្មណ៍មុខងារ

មគ្គុទេសក៍ទូលំទូលាយនេះជួយអ្នកក្នុងការជ្រើសរើស SKU សេវាកម្ម Azure ដែលអាចប្រើបានល្អបំផុតសម្រាប់បរិយាកាស ផលប៉ះពាល់ការងារ និងតម្រូវការផ្សេងៗ។ រៀនវិធីវិភាគតម្រូវការសមត្ថភាព, ការពិចារណាអំពីថ្លៃ និងតម្រូវការជម្រើសដើម្បីជ្រើសរើសថ្នាក់សេវាកម្មដែលសមស្របសម្រាប់ការដាក់បញ្ចូល Azure Developer CLI របស់អ្នក។

## គោលបំណងរៀន

ក្រោយពេលបញ្ចប់មគ្គុទេសក៍នេះ អ្នកនឹង៖
- យល់ដឹងអំពីកំណត់ SKU Azure, គំរូតម្លៃ និងភាពខុសគ្នានៃមុខងារ
- ជំនាញវិធីជ្រើសរើស SKU សម្រាប់បរិយាកាសផ្សេងៗដូចជា ការអភិវឌ្ឍ ការត្ងល់ និងផលិតកម្ម
- វិភាគតម្រូវការផលប៉ះពាល់ និងផ្គូផ្គងវាទៅនឹងថ្នាក់សេវាកម្មសមរម្យ
- អនុវត្តយុទ្ធសាស្ត្រកាត់បន្ថយថ្លៃតាមរយៈការជ្រើសរើស SKU វិចារណាជ្រៅ
- អនុវត្តវិធីសាស្ត្រតេស្តនិងផ្ទៀងផ្ទាត់សមត្ថភាពសម្រាប់ការជ្រើសរើស SKU
- កំណត់ការផ្តល់អនុសាសន៍ SKU និងការត្រួតពិនិត្យដោយស្វ័យប្រវត្តិ

## លទ្ធផលរៀន

ក្រោយពេលបញ្ចប់ អ្នកនឹងអាច៖
- ជ្រើសរើស SKU សេវាកម្ម Azure ដែលសមស្របដោយផ្អែកលើតម្រូវការនិងកំណត់ដែនការងារ
- ធ្វើរចនាសម្ព័ន្ធថ្លៃត្រឹមត្រូវក្នុងបរិយាកាសច្រើនដោយជ្រើសរើសថ្នាក់សមរម្យ
- អនុវត្តវាស់វែងនិងផ្ទៀងផ្ទាត់សមត្ថភាពសម្រាប់ជម្រើស SKU
- បង្កើតឧបករណ៍ស្វ័យប្រវត្តិសម្រាប់អនុសាសន៍ SKU និងកាត់បន្ថយថ្លៃ
- គ្រោងផែនការផ្លាស់ប្តូរ SKU និងយុទ្ធសាស្ត្រកែលំអរអតិផរណា
- អនុវត្តគោលការណ៍ Azure Well-Architected Framework ទៅការជ្រើសរើសថ្នាក់សេវាកម្ម

## តារាងមាតិកា

- [ការយល់ដឹងអំពី SKU](#understanding-skus)
- [ការជ្រើសរើសផ្អែកលើបរិយាកាស](#environment-based-selection)
- [មគ្គុទេសក៍សេវាកម្មជាក់លាក់](#service-specific-guidelines)
- [យុទ្ធសាស្ត្រកាត់បន្ថយថ្លៃ](#cost-optimization-strategies)
- [ជំនាញផ្នែកសមត្ថភាព](#performance-considerations)
- [តារាងយោងរហ័ស](#quick-reference-tables)
- [ឧបករណ៍ផ្ទៀងផ្ទាត់](#validation-tools)

---

## ការយល់ដឹងអំពី SKU

> **ឧទាហរណ៍ប្រូហ្គ្រាម៖** ផែនទី YAML SKU និងការកំណត់សមត្ថភាពខាងក្រោមគឺជាហាទំនក់ចិត្តគំនិតការរចនា មិនមែនជា `azure.yaml` សមាជិកគំនូរការរចនាឬកំណត់ម៉ាស់សម្ភារៈ។ ប្លុក Bicep គឺជាជម្រើស/ប្លុកជំរើស៖ បង្ហាញប៉ារ៉ាម៉ែត្រ និងធនធានមេរបស់ពួកវា ប្រើឈ្មោះនិមិត្តសញ្ញាឯកសិទ្ធឱ្យខុសគ្នាពេលផ្សំគ្នា ហើយភ្ជាប់ម៉ូឌុលទៅក្នុងគម្រោងដំណើរការ។ តម្លៃ កំណត់ និងភាពអាចប្រើបាននៃតំបន់/SKU ត្រូវត្រូវបានពិនិត្យមុនការដាក់បញ្ចូលសម្រាប់ការជាវរបស់អ្នក។

### SKU គឺជាអ្វី?

SKU (Stock Keeping Units) ជានិមិត្តសញ្ញាសម្រាប់ថ្នាក់សេវាកម្ម និងកម្រិតសមត្ថភាពផ្សេងៗសម្រាប់ធនធាន Azure។ គ្រប់ SKU ផ្តល់នូវ៖

- **លក្ខណៈសមត្ថភាព** (CPU, អង្គចងចាំ, ប្រសិទ្ធភាពប្រតិបត្តិការ)
- **ការចូលប្រើមុខងារ** (ជម្រើសបត់បែន, កម្រិត SLA)
- **គំរូតម្លៃ** (ការបរិភោគ, កំណត់ថេរ)
- **ភាពអាចប្រើបានតាមតំបន់** (មិនមែនគ្រប់ SKU មាននៅគ្រប់តំបន់ទាំងអស់)

### តួអង្គសំខាន់ៗក្នុងការជ្រើសរើស SKU

1. **តម្រូវការផលប៉ះពាល់ការងារ**
   - លំនាំចរាចរណ៍/ផ្ទុកដែលរំពឹងទុក
   - តម្រូវការសមត្ថភាព (CPU, អង្គចងចាំ, អ៊ីអូ)
   - តម្រូវការផ្ទុក និងលំនាំចូលប្រើ

2. **ប្រភេទបរិយាកាស**
   - ការអភិវឌ្ឍ/បន្ទាប់បន្សំ ដល់ផលិតកម្ម
   - តម្រូវការចូលប្រើ
   - តម្រូវការសុវត្ថិភាព និងការអនុលោមខ្លះៗ

3. **កំណត់ថវិកា**
   - តម្លៃដើមបញ្ចូល ប្រៀបធៀបនឹងតម្លៃចំណាយប្រតិបត្ដិការ
   - បញ្ចុះតម្លៃសម្រាប់កំណត់ថេរ
   - អនុភាពដើម្បីបត់បែនតម្លៃដោយស្វ័យប្រវត្តិ

4. **ការគ្រោងការកំណើន**
   - តម្រូវការចំណុះលើស
   - តម្រូវការមុខងារពេលអនាគត
   - ភាពស្មុគស្មាញនៃការផ្លាស់ប្តូរ

---

## ការជ្រើសរើសផ្អែកលើបរិយាកាស

### បរិយាកាសការអភិវឌ្ឍ

**ចំណុចចម្បង**: ការកាត់បន្ថយថ្លៃ, មុខងារមូលដ្ឋាន, ការផ្តល់ជូនងាយស្រួល

#### SKU ដែលត្រូវបានណែនាំ
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

#### លក្ខណៈ
- **សេវាកម្មកម្មវិធី**: F1 (ឥតគិតថ្លៃ) ឬ B1 (មូលដ្ឋាន) សម្រាប់ការតេស្តសាមញ្ញ
- **មូលដ្ឋានទិន្នន័យ**: ថ្នាក់មូលដ្ឋាន មានធនធានតិចតួច
- **ផ្ទុក**: ស្ដង់ដារជាមួយការធន់ទ្រាំត្រឹមតែជាតំបន់
- **គណនា**: ធនធានចែករំលែកអាចទទួលបាន
- **បណ្តាញ**: ការកំណត់មូលដ្ឋាន

### បរិយាកាសកំណត់ស្តតិ/តេស្ត

**ចំណុចចម្បង**: ការកំណត់ស្តីពីផលិតកម្ម, តុល្យភាពថ្លៃចំណាយ, សមត្ថភាពតេស្ត

#### SKU ដែលត្រូវបានណែនាំ
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

#### លក្ខណៈ
- **សមត្ថភាព**: 70-80% នៃថាមពលផលិតកម្ម
- **មុខងារ**: ភាគច្រើនមុខងារផលិតកម្មដំណើរការ
- **ការធន់ទ្រាំ**: ការធន់ទ្រាំភូមិសាស្ត្រមួយចំនួន
- **បត់បែន**: ការតម្រឹមបត់បែនជំនួយតេស្តតិចតួច
- **ត្រួតពិនិត្យ**: ស្តាប់ត្រួតពិនិត្យពេញលេញ

### បរិយាកាសផលិតកម្ម

**ចំណុចចម្បង**: សមត្ថភាព, ភាពអាចប្រើបាន, សុវត្ថិភាព, អនុលោម, ការបត់បែន

#### SKU ដែលត្រូវបានណែនាំ
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

#### លក្ខណៈ
- **ភាពអាចប្រើបានខ្ពស់**: តម្រូវ SLA 99.9%+
- **សមត្ថភាព**: ធនធានប្រកើត ដំណើរការខ្ពស់
- **សុវត្ថិភាព**: មុខងារសុវត្ថិភាពពិសេស
- **បត់បែន**: សមត្ថភាពបត់បែនស្វ័យប្រវត្តិពេញលេញ
- **ត្រួតពិនិត្យ**: ការត្រួតពិនិត្យលម្អិត

---

## មគ្គុទេសក៍សេវាកម្មជាក់លាក់

### សេវាកម្មកម្មវិធី Azure

#### ម៉ាទ្រីកសម្រាប់សំរេចក្នុងការជ្រើស SKU

| ករណីប្រើប្រាស់ | SKU ដែលណែនាំ | មូលហេតុ |
|----------|----------------|-----------|
| ការអភិវឌ្ឍ/តេស្ត | F1 (ឥតគិតថ្លៃ) ឬ B1 (មូលដ្ឋាន) | ថ្លៃសមរម្យ សម្រាប់តេស្ត |
| កម្មវិធីផលិតកម្មតូច | S1 (ស្ដង់ដារ) | ដែនបុគ្គល ការ SSL បត់បែនស្វ័យប្រវត្តិ |
| កម្មវិធីផលិតកម្មមធ្យម | P1V3 (ព្រីមីយ៉ម V3) | សមត្ថភាពល្អ ប្រសិទ្ធភាពជាច្រើន |
| កម្មវិធីចរាចរណ៍ខ្ពស់ | P2V3 ឬ P3V3 | ធនធានឯកជន សមត្ថភាពខ្ពស់ |
| កម្មវិធីមានសារៈសំខាន់ | I1V2 (ដែលបានបំបែក V2) | ការបំបែកបណ្ដាញ ឧបករណ៍ឯកជន |

#### ឧទាហរណ៍ការកំណត់បរិស្ថាន

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

### មូលដ្ឋានទិន្នន័យ Azure SQL

#### សំណុំស្ដង់ SKU

1. **DTU-based (ផ្នែកប្រតិបត្តិការទិន្នន័យ)**
   - **មូលដ្ឋាន**: 5 DTU - ការអភិវឌ្ឍ/តេស្ត
   - **ស្ដង់ដារ**: S0-S12 (10-3000 DTU) - គោលបំណងទូទៅ
   - **ព្រីមីយ៉ម**: P1-P15 (125-4000 DTU) - សម្រាប់សមត្ថភាពខ្ពស់

2. **vCore-based** (ណែនាំសម្រាប់ផលិតកម្ម)
   - **គោលបំណងទូទៅ**: សមត្ថភាពគណនា និងផ្ទុកត្រូវតុល្យភាព
   - **សារៈសំខាន់សម្រាប់អាជីវកម្ម**: បង់ពេលយឺតតិច, ប្រតិបត្តិការ IOPS ខ្ពស់
   - **Hyperscale**: ផ្ទុកបានធំជាងមុន; ពិនិត្យទំហំបច្ចុប្បន្ន និងការគាំទ្រតំបន់

#### ឧទាហរណ៍ការកំណត់បរិស្ថាន

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

#### ប្រភេទបរិយាកាស

1. **ផ្អែកលើការបរិភោគ**
   - តម្លៃបង់ប្រាក់តាមការប្រើប្រាស់
   - សាកសមសម្រាប់ការអភិវឌ្ឍ និងការងារប្រែប្រួល
   - បណ្ដាប្រព័ន្ធចែកចាយ

2. **គោលបំណងឯកទេស (ប្រវត្តិការងារ)**
   - ធនធានគណនា ឯកជន
   - សមត្ថភាពត្រឹមត្រូវ
   - ល្អសម្រាប់ការប្រើប្រាស់ផលិតកម្ម

#### ឧទាហរណ៍ការកំណត់បរិស្ថាន

**ការអភិវឌ្ឍ (បរិភោគ)**
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

**ផលិតកម្ម (ឯកទេស)**
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

ការធន់ទ្រាំតំបន់ក៏ត្រូវការទ្រព្យសកម្មតំបន់គាំទ្រ និងការកំណត់ VNet/subnet សមរម្យដែលមិនបានរៀបរាប់នៅទីនេះ។ ឧទាហរណ៍នេះរៀបចំចំនួនមូលដ្ឋានឯកទេសបី; ត្រូវកំណត់យ៉ាងហោចណាស់ពីរច្បាប់កម្មវិធីសម្រាប់ចែកចាយតាមតំបន់ និងកំណត់ទំហំច្បាប់និងមូលដ្ឋានសម្រាប់បរាជ័យតំបន់។ មើលការណែនាំភាពទុកចិត្តនៃ [Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps)។ ដើម្បីដាក់កម្មវិធីលើប្រវត្តិរូបនេះ សូមកំណត់ `workloadProfileName: 'production-profile'` របស់វា; ការបង្កើតប្រវត្តិរូបតែមួយមិនបញ្ជាលើកម្មវិធីទេ។

### Azure Cosmos DB

#### គំរូសមត្ថភាព 

1. **សមត្ថភាពបញ្ចូលដោយដៃ**
   - សមត្ថភាពដែលអាចគ្រោងបាន
   - ការបញ្ចុះតម្លៃការកំណត់ថេរ
   - ល្អសម្រាប់ការងារតិចតួច

2. **Autoscale Provisioned Throughput**
   - ការបត់បែនដោយស្វ័យប្រវត្តិតាមការប្រើប្រាស់
   - បង់តាមការប្រើប្រាស់ (មានអប្បបរមា)
   - ល្អសម្រាប់ការងារប្រែប្រួល

3. **Serverless**
   - បង់តាមការ​ទាមទារ
   - គ្មានសមត្ថភាពកំណត់ថេរ
   - ល្អសម្រាប់ការអភិវឌ្ឍ និងការងារតិចតួច

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

### អាជ្ញាបណ្ណផ្ទុក Azure

#### ប្រភេទអាជ្ញាបណ្ណផ្ទុក

1. **Standard_LRS** - ការអភិវឌ្ឍ, ទិន្នន័យមិនសំខាន់
2. **Standard_GRS** - ផលិតកម្ម, តម្រូវការការធន់ទ្រាំជាតំបន់
3. **Premium_LRS** - កម្មវិធីដែលមានសមត្ថភាពខ្ពស់
4. **Premium_ZRS** - ភាពអាចប្រើបានខ្ពស់ជាមួយការធន់ទ្រាំតំបន់

#### ថ្នាក់សមត្ថភាព

- **ស្ដង់ដារ**: គោលបំណងទូទៅ, ថ្លៃសមរម្យ
- **ព្រីមីយ៉ម**: សមត្ថភាពខ្ពស់, សេណារីយ៉ូនទាប-កំណត់ពេលពេញលេញ

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

### 1. ការកំណត់ថេរ

កំណត់ធនធានជាមុនរយៈពេល 1-3 ឆ្នាំសម្រាប់បញ្ចុះតម្លៃពីរបៀបធំ:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

ការផ្តល់ជម្រើសការកំណត់ និងប្រភេទធនធានដែលអាចភាគរយបានមានប្រែប្រួល; សូមពិនិត្យឯកសារមាតិកា និងលក្ខខណ្ឌទិញជាច្រើន មិនត្រូវគិតថាគ្រប់សេវា/SKU គាំទ្រការកំណត់ទុក។

### 2. កំណត់ទំហំត្រឹមត្រូវ

ចាប់ផ្តើមពី SKU តូចៗ ហើយបន្ដខ្ពស់ឡើងទៅតាមការប្រើប្រាស់ពិតប្រាកដ៖

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

### 3. កំណត់បត់បែនស្វ័យប្រវត្តិ

អនុវត្តការបត់បែនអัจកสริยะដើម្បីអុបទីម៉ៃសថ្លៃ៖

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

### 4. ការបត់បែនតាមកាលវិភាគ

បត់បែនចុះក្នុងម៉ោងក្រៅការងារ៖

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

## ការពិចារណាសមត្ថភាព

### តម្រូវការសមត្ថភាពមូលដ្ឋាន

កំណត់តម្រូវការ​សមត្ថភាព​ជាក់លាក់ មុនការជ្រើស SKU៖

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

### ការតេស្តផ្ទុក

តេស្ត SKU ខុសៗគ្នាដើម្បីផ្ទៀងផ្ទាត់សមត្ថភាព៖

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### ការត្រួតពិនិត្យ និងអុបទីម៉ៃស

ចាប់ផ្តើមការត្រួតពិនិត្យលម្អិត៖

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

## តារាងយោងរហ័ស

### តារាងយោងតាម SKU សម្រាប់សេវាកម្មកម្មវិធី

| SKU | ថ្នាក់ | vCPU | អង្គចងចាំ | ផ្ទុក | ជួរតម្លៃ | ករណីប្រើប្រាស់ |
|-----|------|------|-----|---------|-------------|----------|
| F1 | ឥតគិតថ្លៃ | ចែករំលែក | 1GB | 1GB | ឥតគិតថ្លៃ | ការអភិវឌ្ឍ |
| B1 | មូលដ្ឋាន | 1 | 1.75GB | 10GB | $ | កម្មវិធីតូច |
| S1 | ស្ដង់ដារ | 1 | 1.75GB | 50GB | $$ | ផលិតកម្ម |
| P1V3 | ព្រីមីយ៉ម V3 | 2 | 8GB | 250GB | $$$ | សមត្ថភាពខ្ពស់ |
| I1V2 | បំបែក V2 | 2 | 8GB | 1TB | $$$$ | សហគ្រាស |

### តារាងយោង SKU សម្រាប់មូលដ្ឋានទិន្នន័យ SQL

| SKU | ថ្នាក់ | DTU/vCore | ផ្ទុក | ជួរតម្លៃ | ករណីប្រើប្រាស់ |
|-----|------|-----------|---------|-------------|----------|
| មូលដ្ឋាន | មូលដ្ឋាន | 5 DTU | 2GB | $ | ការអភិវឌ្ឍ |
| S2 | ស្ដង់ដារ | 50 DTU | 250GB | $$ | ផលិតកម្មតូច |
| P2 | ព្រីមីយ៉ម | 250 DTU | 1TB | $$$ | សមត្ថភាពខ្ពស់ |
| GP_Gen5_4 | គោលបំណងទូទៅ | 4 vCore | 4TB | $$$ | តុល្យភាព |
| BC_Gen5_8 | សារៈសំខាន់សម្រាប់អាជីវកម្ម | 8 vCore | 4TB | $$$$ | សារជាធម្មតា |

### តារាងយោង SKU សម្រាប់ Container Apps

| ម៉ូដែល | តម្លៃ | CPU/អង្គចងចាំ | ករណីប្រើប្រាស់ |
|-------|---------|------------|----------|
| ការបរិភោគ | បង់តាមការប្រើប្រាស់ | ការរួមបញ្ចូល CPU/អង្គចងចាំដែលគាំទ្រពឹងផ្អែកលើយ៉ាងនៅក្នុងបរិយាកាស/ប្រវត្តិរូប | ការអភិវឌ្ឍ ឬផលិតកម្ម, ផ្ទុកប្រែប្រួល |
| Dedicated D4 | ការបង់តាមមូលដ្ឋានឯកជន | 4 vCPU, 16GiB ក្នុងមូលដ្ឋានមួយ | តម្រូវការផ្ទុកច្រើន/ការបំបែក |
| Dedicated D8 | ការបង់តាមមូលដ្ឋានឯកជន | 8 vCPU, 32GiB ក្នុងមូលដ្ឋានមួយ | បន្ទុកថ្កោលខ្ពស់ជាង |

---

## ឧបករណ៍ផ្ទៀងផ្ទាត់

### ប្រព័ន្ធពិនិត្យភាពអាចប្រើបានរបស់ SKU

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

### ស្គ្រីបអនុវត្តការគណនាតម្លៃ

**Pseudo-code ក្រៅពីនេះ**: `Get-ResourceCost` ខាងក្រោមគឺជាអនុគមន៍ជាក់លាក់សម្រាប់គម្រោងដែលអ្នកត្រូវអនុវត្ត ដោយប្រើតម្លៃតំបន់/កិច្ចសន្យាបច្ចុប្បន្ន និងការសន្និដ្ឋានប្រើប្រាស់។ វាមិនមែន PowerShell ឬ Azure cmdlet ទេ។

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

### ការផ្ទៀងផ្ទាត់សមត្ថភាព

YAML ខាងក្រោមជារូបរាងរបស់តម្រូវការសម្រាប់ព័ត៌មាន ជា **មិនមែន** ប្លុកបញ្ចូលសម្រាប់ Azure Load Testing, JMeter, Locust, ឬ k6។ ប្រែវាទៅកំណត់ការលក្ខណៈពិតនៅក្នុងឧបករណ៍ដែលអ្នកជ្រើសរើសមុនប្រើបញ្ជា load-test ខាងលើ។

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

## សង្ខេបអនុវត្តមានប្រសិទ្ធភាព

### អ្វីដែលគួរធ្វើ

1. **ចាប់ផ្តើមតូច និងបន្ដខ្ពស់ឡើង** ដោយផ្អែកលើយ៉ាងត្រឹមត្រូវនៃការប្រើប្រាស់
2. **ប្រើ SKU ប្លែកៗសម្រាប់បរិយាកាសផ្សេងៗ**
3. **ត្រួតពិនិត្យសមត្ថភាព និងថ្លៃជាបន្តបន្ទាប់**
4. **ប្រើចំណុចតំណក់បញ្ចុះថ្លៃសម្រាប់ការប្រើប្រាស់ផលិតកម្ម**
5. **អនុវត្តការបត់បែនស្វ័យប្រវត្តិនៅកន្លែងសមរម្យ**
6. **តេស្តសមត្ថភាពជាមួយការងារពិតប្រាកដ**
7. **គ្រោងការកំណើន ប៉ុន្តែមិនត្រូវចំណាយលើប្រព័ន្ធលើស**
8. **ប្រើថ្នាក់ឥតគិតថ្លៃសម្រាប់ការអភិវឌ្ឍ ពេលអាចធ្វើបាន**

### អ្វីដែលមិនគួរធ្វើ

1. **កុំប្រើ SKU ផលិតកម្មសម្រាប់ការអភិវឌ្ឍ**
2. **កុំភ្លេចពីភាពអាចប្រើបាន SKU តាមតំបន់**
3. **កុំភ្លេចថ្លៃផ្ទេរទិន្នន័យ**
4. **កុំខ្លាចប្រើប្រាស់លើសដោយគ្មានហេតុផល**
5. **កុំភ្លេចផលប៉ះពាល់នៃការគាំទ្រ**
6. **កុំកំណត់កំណត់ខ្ពស់សម្រាប់បត់បែនស្វ័យប្រវត្តិ**
7. **កុំភ្លេចតម្រូវការអនុលោម**
8. **កុំសម្រេចចិត្តចែរតម្លៃតែប៉ុណ្ណោះ**

---

**ជំនួយវិជ្ជាជីវៈ**: ប្រើ Azure Cost Management និង Advisor ដើម្បីទទួលបានការណែនាំផ្ទាល់ខ្លួនសម្រាប់អុបទីម៉ៃសំណុំព្រឹត្តិការណ៍ SKU របស់អ្នកដោយផ្អែកលើយ៉ាងត្រឹមត្រូវនៃការប្រើប្រាស់។

---

**ការរុករក**
- **មុខវិជ្ជាមុន**: [ការធ្វើផែនការទិញថាមពល](capacity-planning.md)
- **មុខវិជ្ជាបន្ទាប់**: [ការត្រួតពិនិត្យមុនហោះ](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->