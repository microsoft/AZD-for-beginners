# SKU தெரிவு வழிகாட்டி - சரியான Azure சேவை நிலைகளை தேர்வு செய்வது

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி தொடக்கம்**: [AZD தொடக்கக்காரர்களுக்கானது](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 6 - முன்-பதிவேற்றம் சரிபார்ப்பு மற்றும் திட்டமிடல்
- **⬅️ முந்தயது**: [திறன் திட்டமிடல்](capacity-planning.md)
- **➡️ அடுத்தது**: [முன்-பரிசோதனைச் சரிபார்ப்புகள்](preflight-checks.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 7: பிரச்சனைகள் தீர்க்குதல்](../chapter-07-troubleshooting/common-issues.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி வெவ்வேறு சுற்றுப்புறங்கள், பணிப்படைப்புகள் மற்றும் தேவைகளுக்காக சிறந்த Azure சேவை SKU களை (Stock Keeping Units) தேர்வு செய்ய உதவுகிறது. செயல்திறன் தேவைகளை, செலவுத் தகுதிகளை மற்றும் அளவீட்டு தேவைகளை பகுப்பாய்வு செய்து உங்கள் Azure Developer CLI வினியோகங்களுக்கு பொருத்தமான சேவை நிலைகளை தேர்வு செய்வதை கற்றுக்கொள்ளுங்கள்.

## கற்றல் குறிக்கோள்கள்

இந்த வழிகாட்டியை முடித்தவுடன், நீங்கள்:
- Azure SKU கருத்துகள், விலை மாதிரிகள் மற்றும் அம்ச வேறுபாடுகளைப் புரிந்துகொள்வீர்கள்
- வளர்ச்சி, ஸ்டேஜிங் மற்றும் தயாரிப்பு சுற்றுப்புறங்களுக்கு குறிப்பிட்ட SKU தேர்வு தந்திரங்களை ஆக்கப்படுத்தித் துல்லியமாக கையாள்வீர்கள்
- பணித்திறன் தேவைகளை பகுப்பாய்வு செய்து அவற்றை பொருத்தமான சேவை நிலைகளுடன் பொருத்திட முடிவீர்கள்
- அறிவுடைமையான SKU தேர்வின் மூலம் செலவுச் சீர்திருத்தக் கொள்கைகளை நடைமுறைப்படுத்துவீர்கள்
- SKU தேர்வுகளுக்கு செயல்திறன் சோதனை மற்றும் சரிபார்ப்பு நுட்பங்களை பயன்படுத்துவீர்கள்
- தானாக்கப்பட்ட SKU பரிந்துரைகள் மற்றும் கண்காணிப்பை அமைப்பீர்கள்

## கற்றல் முடிவுகள்

முடித்தவுடன், நீங்கள் திறமையாக செய்ய முடியும்:
- பணித்திறன் தேவைகள் மற்றும் கட்டுப்பாடுகளின் அடிப்படையில் பொருத்தமான Azure சேவை SKU களை தேர்வு செய்ய
- சரியான நிலை தேர்வுடன் பல-சுற்றுப்புற கட்டமைப்புகளை செலவுசார் முறையில் வடிவமைக்க
- SKU தேர்வுகளுக்கான செயல்திறன் பெஞ்ச்மார்க்கிங் மற்றும் சரிபார்ப்பை நடைமுறைப்படுத்த
- SKU பரிந்துரை மற்றும் செலவுச் சீர்திருத்தத்திற்கான தானியங்கி கருவிகளை உருவாக்க
- மாறும் தேவைகளுக்காக SKU இடமாற்றங்கள் மற்றும் ஸ்கேலிங் தந்திரங்களை திட்டமிட
- சேவை நிலை தேர்வில் Azure Well-Architected Framework கொள்கைகளை பயன்படுத்த

## உள்ளடக்க அட்டவணை

- [SKUs ஐப் புரிந்துகொள்ளுதல்](../../../../docs/chapter-06-pre-deployment)
- [சூழலுக்கேற்ப தேர்வு](../../../../docs/chapter-06-pre-deployment)
- [சேவை-சார்ந்த வழிகாட்டிகள்](../../../../docs/chapter-06-pre-deployment)
- [செலவுச் சீர்திருத்தக் கொள்கைகள்](../../../../docs/chapter-06-pre-deployment)
- [செயல்திறன் தொடர்பான பரிசீலனைகள்](../../../../docs/chapter-06-pre-deployment)
- [விரைவு குறிப்பு அட்டவணைகள்](../../../../docs/chapter-06-pre-deployment)
- [சரிபார்ப்பு கருவிகள்](../../../../docs/chapter-06-pre-deployment)

---

## SKUs ஐப் புரிந்துகொள்ளுதல்

### SKU கள் என்றால் என்ன?

SKU கள் (Stock Keeping Units) என்பது Azure வளங்களுக்கான வெவ்வேறான சேவை நிலைகள் மற்றும் செயல்திறன் நிலைகளை பிரதிநிதித்துவம் செய்கின்றன. ஒவ்வொரு SKU யும் வேறுபட்டவை:

- **செயல்திறன் பண்புகள்** (CPU, memory, throughput)
- **அம்ச கிடைப்பின்மை** (scaling விருப்பங்கள், SLA நிலைகள்)
- **விலை மாதிரிகள்** (செலவு அடிப்படையிலானது, ஒதுக்கப்பட்ட திறன்)
- **பிராந்திய அடையத்தன்மை** (இல்லா ரீதியாக அனைத்து பிராந்தியங்களிலும் கிடையாது)

### SKU தேர்வில் முக்கிய காரணிகள்

1. **பணித்திறன் தேவைகள்**
   - எதிர்பார்க்கப்படும் போக்குவரத்து/ஏற்றுக்கொள்வுத் துறைகள்
   - செயல்திறன் தேவைகள் (CPU, memory, I/O)
   - சேமிப்பு தேவைகள் மற்றும் அணுகல் முறை

2. **சுற்றுப்புற வகை**
   - வளர்ச்சி/சோதனை vs. தயாரிப்பு
   - கிடைக்கும் தன்மை தேவைகள்
   - பாதுகாப்பு மற்றும் இணக்கத்தன்மை தேவைகள்

3. **பட்ஜெட் கட்டுப்பாடுகள்**
   - ஆரம்பச் செலவுகள் vs. செயல்பாட்டு செலவுகள்
   - ஒதுக்கப்பட்ட திறன் தள்ளுபடிகள்
   - ஆட்டோ-ஸ்கேலிங் செலவுநோக்கங்கள்

4. ** வளர்ச்சி முன்னறிதல்கள்**
   - அளவீட்டு தேவைகள்
   - எதிர்கால அம்ச தேவைகள்
   - இடமாற்றம் சிக்கல்

---

## சூழலுக்கேற்ப தேர்வு

### வளர்ச்சி சூழல்

**முதல் முன்னுரிமைகள்**: செலவுச் சீர்திருத்தம், அடிப்படை செயல்பாடு, எளிய வழங்கல்/நிராகரிப்பு

#### Recommended SKUs
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

#### பண்புகள்
- **App Service**: எளிய சோதனைக்காக F1 (இலவசம்) அல்லது B1 (அடிப்படை)
- **தரவுத்தளங்கள்**: குறைந்த வளங்களுடன் அடிப்படை நிலை
- **சேமிப்பு**: உள்ளூர் மீட்பு மட்டும் கொண்ட சாதாரணம்
- **கணக்கீடு**: பகிரப்பட்ட வளங்கள் ஏற்றுக்கொள்ளத்தக்கவை
- **பிணையமைப்பு**: அடிப்படை சொமைப்புகள்

### ஸ்டேஜிங்/சோதனை சூழல்

**முதல் முன்னுரிமைகள்**: தயாரிப்பு போன்ற கட்டமைப்பு, செலவு சமநிலை, செயல்திறன் சோதனை திறன்

#### Recommended SKUs
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

#### பண்புகள்
- **செயல்திறன்**: தயாரிப்பு திறனின் 70-80%
- **அம்சங்கள்**: பெரும்பாலான தயாரிப்பு அம்சங்கள் இயலுதியாக நேர்த்தியமைக்கப்பட்டவை
- **நகலெடுக்குமுறை**: சில புவியியல் நகலெடுக்கல்
- **ஸ்கேலிங்**: சோதனைக்காக வரம்புக்குள்ளாக தானியக்க ஸ்கேலிங்
- **கண்காணிப்பு**: முழுமையான கண்காணிப்பு ஸ்டாக்

### தயாரிப்பு சூழல்

**முதல் முன்னுரிமைகள்**: செயல்திறன், கிடைக்குமைகள், பாதுகாப்பு, இணக்கத்தன்மை, அளவீடு

#### Recommended SKUs
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

#### பண்புகள்
- **உயர் கிடைக்குமை**: 99.9%+ SLA தேவைகள்
- **செயல்திறன்**: ஒதுக்கப்பட்ட வளங்கள், உயர் திறன்
- **பாதுகாப்பு**: பிரீமியம் பாதுகாப்பு அம்சங்கள்
- **ஸ்கேலிங்**: முழுமையான தானியக்க ஸ்கேலிங் திறன்கள்
- **கண்காணிப்பு**: விரிவான பார்வையிடுதல்

---

## சேவை-சார்ந்த வழிகாட்டிகள்

### Azure App Service

#### SKU தீர்வு மாதிரிகள்

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### அமைப்பு எடுத்துக்காட்டுகள்

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

#### SKU தேர்வு கட்டமைப்பு

1. **DTU-ஆதாரமடைந்தது (Database Transaction Units)**
   - **Basic**: 5 DTU - வளர்ச்சி/சோதனை
   - **Standard**: S0-S12 (10-3000 DTU) - பொது நோக்கத்திற்கு
   - **Premium**: P1-P15 (125-4000 DTU) - செயல்திறன்-ஐக்கியமானவை

2. **vCore-ஆதாரமடைந்தது** (தயாரிப்பிற்கு பரிந்துரைக்கப்படுகிறது)
   - **General Purpose**: கணக்கீடு மற்றும் சேமிப்பின் சமநிலை
   - **Business Critical**: குறைந்த தாமதம், உயர் IOPS
   - **Hyperscale**: மிக உயர்ந்த அளவீட்டு சேமிப்பு (100TB வரை)

#### எடுத்துக்காட்டு கட்டமைப்புகள்

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

#### சூழல் வகைகள்

1. **நுகர்வு-அடிப்படை**
   - பயன்பாட்டுக்கான தாக்கம் அணுகல்
   - வளர்ச்சிக்குப் மற்றும் மாறும் பணிகள் பொருத்தமானது
   - பகிரப்பட்ட அடிப்படை அமைப்பு

2. **ஒதுக்கப்பட்ட (பணிப் சுயவிவரங்கள்)**
   - ஒதுக்கப்பட்ட கணக்கீடு வளங்கள்
   - கணிக்கமுடிந்த செயல்திறன்
   - தயாரிப்பு பணிகளுக்கு சிறந்தது

#### அமைப்பு எடுத்துக்காட்டுகள்

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

#### திறன் மாதிரிகள்

1. **கைகாட்டி ஒதுக்கப்பட்ட திறன் (Manual Provisioned Throughput)**
   - கணிப்பிடத்தக்க செயல்திறன்
   - ஒதுக்கிய திறன் தள்ளுபடிகள்
   - நிலையான பணிகளுக்கு சிறந்தது

2. **Autoscale Provisioned Throughput**
   - பயன்பாட்டின் அடிப்படையில் தானாக ஸ்கேல் ஆகிறது
   - நீங்கள் பயன்படுத்துவது மட்டுமே செலுத்த வேண்டும் (குறைந்ததொரு வரம்புடன்)
   - மாறும் பணிகளுக்கு தகுதியானது

3. **Serverless**
   - கோரிக்கைக்கே செலுத்துங்கள்
   - ஒதுக்கப்பட்ட திறன் இல்லை
   - வளர்ச்சி மற்றும் இட偶அனுபவ பணிகளுக்கு சிறந்தது

#### SKU எடுத்துக்காட்டுகள்

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

#### சேமிப்பு கணக்கு வகைகள்

1. **Standard_LRS** - வளர்ச்சி, அவசியமற்ற தரவு
2. **Standard_GRS** - தயாரிப்பு, புவி-நகலெடுக்கல் தேவைப்படும்போது
3. **Premium_LRS** - உயர் செயல்திறன் பயன்பாடுகள்
4. **Premium_ZRS** - மண்டலம்-நகலெடுக்கலை கொண்ட உயர் கிடைக்குமை

#### செயல்திறன் நிலைகள்

- **Standard**: பொது நோக்கம், செலவிடக்கூடியது
- **Premium**: உயர் செயல்திறன், குறைந்த தாமத சூழல்கள்

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

## செலவுச் சீர்திருத்தக் கொள்கைகள்

### 1. ஒதுக்கப்பட்ட திறன்

1-3 ஆண்டுகள் இருக்கும்படி வளங்களை ஒதுக்கி வைக்கவும் முக்கிய தள்ளுபடிகளுக்காக:

```bash
# முன்பதிவு விருப்பங்களைச் சரிபார்க்கவும்
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. சரியான அளவீடு

சிறிய SKU களில் தொடங்கி உண்மையான பயன்பாட்டின் அடிப்படையில் உயர்த்துங்கள்:

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

### 3. தானியங்கி ஸ்கேலிங் அமைப்பு

செலவுகளை சீர்செய்ய அறிவு அடிப்படையிலான ஸ்கேலிங் அம்சங்களை நடைமுறைப்படுத்துங்கள்:

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

### 4. திட்டமிடப்பட்ட ஸ்கேலிங்

வேலை நடத்தப்படாத நேரங்களில் குறைப்பதை திட்டமிடுங்கள்:

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

## செயல்திறன் தொடர்பான பரிசீலனைகள்

### அடிப்படை செயல்திறன் தேவைகள்

SKU தேர்வுக்கு முன் தெளிவான செயல்திறன் தேவைகளை வரையறுக்கவும்:

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

### லோட் சோதனை

வिभிந்த SKU களை சோதித்து செயல்திறன் சரிபார்க்கவும்:

```bash
# அஜூர் சுமை சோதனை சேவை
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### கண்காணிப்பு மற்றும் மேம்படுத்தல்

முழுமையான கண்காணிப்பை அமைத்துக் கொண்டு, மேம்படுத்தலைச் செய்யுங்கள்:

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

## விரைவு குறிப்பு அட்டவணைகள்

### App Service SKU விரைவு குறிப்பு

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | வளர்ச்சி |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | சிறிய பயன்பாடுகள் |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | தயாரிப்பு |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | உயர் செயல்திறன் |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | எண்டர்பிரைஸ் |

### SQL தரவுத்தளம் SKU விரைவு குறிப்பு

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | வளர்ச்சி |
| S2 | Standard | 50 DTU | 250GB | $$ | சிறிய தயாரிப்பு |
| P2 | Premium | 250 DTU | 1TB | $$$ | உயர் செயல்திறன் |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | சமநிலையானது |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | முக்கியமான பணி |

### Container Apps SKU விரைவு குறிப்பு

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | வளர்ச்சி, மாறும் ஏற்றம் |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | தயாரிப்பு |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | உயர் செயல்திறன் |

---

## சரிபார்ப்பு கருவிகள்

### SKU கிடைக்கும் சோதனையாளர்

```bash
#!/bin/bash
# இலக்கு பிராந்தியத்தில் SKU கிடைக்கும் நிலையை சரிபார்க்கவும்

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

# பயன்பாடு
check_sku_availability "eastus" "app-service" "P1V3"
```

### செலவு மதிப்பீடு ஸ்கிரிப்ட்

```powershell
# செலவுக் கணிப்பிற்கான PowerShell ஸ்கிரிப்ட்
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
        
        # Azure விலை API அல்லது கணக்கீட்டு கருவியை பயன்படுத்தவும்
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# பயன்பாடு
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### செயல்திறன் சரிபார்ப்பு

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

## சிறந்த நடைமுறைகள் சுருக்கம்

### செய்ய வேண்டியவை

1. **சிறியது தொடங்கி மேலேற்றுங்கள்** உண்மையான பயன்பாட்டின் அடிப்படையில்
2. **பெரியவாறு சுற்றுப்புறங்களுக்கு வெவ்வேறு SKU களைப் பயன்படுத்துங்கள்**
3. **செயல்திறன் மற்றும் செலவுகளை தொடர்ந்து கண்காணியுங்கள்**
4. **தயாரிப்பு பணிக்காக ஒதுக்கப்பட்ட திறனை பயன்படுத்துங்கள்**
5. **தகுந்த இடங்களில் தானியக்க ஸ்கேலிங்கை அமல்படுத்துங்கள்**
6. **நிஜமான பணிகளால் செயல்திறன் சோதனைகளை நடத்துங்கள்**
7. **வளர்ச்சிக்குத் திட்டமிடுங்கள், ஆனால் அதிக அளவீட்டிலிருந்து தவிருங்கள்**
8. **வளர்ச்சிக்காக இலவச நிலைகளை பயன்படுத்துங்கள்**

### செய்யக் கூடாதவை

1. **வளர்ச்சிக்காக தயாரிப்பு SKU களை பயன்படுத்த வேண்டாம்**
2. **பிராந்திய SKU கிடைப்பை புறவிட வேண்டாம்**
3. **தரவு பரிமாற்றச் செலவுகளை மறக்க வேண்டாம்**
4. **காரணமின்றி அதிக ஒதுக்கீடு செய்ய வேண்டாம்**
5. **இணைப்புகளின் தாக்கத்தை புறக்கணிக்க வேண்டாம்**
6. **தானியக்க ஸ்கேலிங் வரம்புகளை மிக உயரமாக அமைக்க வேண்டாம்**
7. **இணக்கத்தன்மை மற்றும் ஒழுங்குமுறை தேவைகளை மறக்க வேண்டாம்**
8. **விலை மட்டும் அடிப்படையாக கொண்டு முடிவெடுக்க வேண்டாம்**

---

**Pro Tip**: Azure Cost Management மற்றும் Advisor ஐ பயன்படுத்தி உங்கள் பயன்பாட்டு முறைமைகளின் அடிப்படையில் தனிப்பட்ட பரிந்துரைகளைப் பெறுங்கள் மற்றும் உங்கள் SKU தேர்வுகளை சீர்திருத்துங்கள்.

---

**Navigation**
- **Previous Lesson**: [திறன் திட்டமிடல்](capacity-planning.md)
- **Next Lesson**: [முன்-பரிசோதனைச் சரிபார்ப்புகள்](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிக்கை:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை Co‑op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சியினாலும், தானியங்கி மொழிபெயர்ப்பில் தவறுகள் அல்லது துல்லியமற்ற தகவல்கள் இருக்கலாம் என்பதை தயவுசெய்து கவனிக்கவும். அசல் மொழியில் உள்ள மூல ஆவணத்தை அதிகாரப்பூர்வமாகக் கருத வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பினை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பின் பயன்பாட்டினால் ஏற்படக்கூடிய எந்த தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கப்படமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->