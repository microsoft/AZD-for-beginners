<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-10-11T15:58:00+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "ta"
}
-->
# SKU தேர்வு வழிகாட்டி - சரியான Azure சேவை நிலைகளை தேர்வு செய்வது எப்படி

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 நடப்பு அத்தியாயம்**: அத்தியாயம் 6 - முன்-வினோதம் சரிபார்ப்பு மற்றும் திட்டமிடல்
- **⬅️ முந்தையது**: [திறன் திட்டமிடல்](capacity-planning.md)
- **➡️ அடுத்தது**: [முன்-பறக்கச் சோதனைகள்](preflight-checks.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 7: பிழை தீர்வு](../troubleshooting/common-issues.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி, வெவ்வேறு சூழல்கள், பணிச்சுமைகள் மற்றும் தேவைகளுக்கான சிறந்த Azure சேவை SKUக்களை (Stock Keeping Units) தேர்வு செய்ய உங்களுக்கு உதவுகிறது. செயல்திறன் தேவைகள், செலவுக் கருத்துக்கள் மற்றும் விரிவாக்க தேவைகளை பகுப்பாய்வு செய்து, உங்கள் Azure Developer CLI பிரயோகங்களுக்கு மிகவும் பொருத்தமான சேவை நிலைகளை தேர்வு செய்வது எப்படி என்பதை கற்றுக்கொள்ளுங்கள்.

## கற்றல் இலக்குகள்

இந்த வழிகாட்டியை முடிக்கும்போது, நீங்கள்:
- Azure SKU கருத்துக்கள், விலை மாதிரிகள் மற்றும் அம்ச வேறுபாடுகளை புரிந்துகொள்வீர்கள்
- மேம்பாடு, பரிசோதனை மற்றும் உற்பத்தி சூழல்களுக்கு தனித்துவமான SKU தேர்வு உத்திகளை கற்றுக்கொள்வீர்கள்
- பணிச்சுமை தேவைகளை பகுப்பாய்வு செய்து, பொருத்தமான சேவை நிலைகளுடன் பொருந்த வைப்பீர்கள்
- புத்திசாலித்தனமான SKU தேர்வின் மூலம் செலவுகளை குறைக்கும் உத்திகளை செயல்படுத்துவீர்கள்
- SKU தேர்வுகளுக்கான செயல்திறன் சோதனை மற்றும் சரிபார்ப்பு நுட்பங்களை பயன்படுத்துவீர்கள்
- தானியங்கி SKU பரிந்துரைகள் மற்றும் கண்காணிப்புகளை அமைப்பீர்கள்

## கற்றல் முடிவுகள்

முடித்தவுடன், நீங்கள்:
- பணிச்சுமை தேவைகள் மற்றும் கட்டுப்பாடுகளின் அடிப்படையில் பொருத்தமான Azure சேவை SKUக்களை தேர்வு செய்ய முடியும்
- சரியான நிலைத் தேர்வுடன் செலவுச்செலவான பல சூழல் கட்டமைப்புகளை வடிவமைக்க முடியும்
- SKU தேர்வுகளுக்கான செயல்திறன் அளவீடு மற்றும் சரிபார்ப்புகளை செயல்படுத்த முடியும்
- SKU பரிந்துரை மற்றும் செலவுக் குறைப்பு உத்திகளுக்கான தானியங்கி கருவிகளை உருவாக்க முடியும்
- மாறும் தேவைகளுக்கான SKU இடமாற்றங்கள் மற்றும் விரிவாக்க உத்திகளை திட்டமிட முடியும்
- Azure Well-Architected Framework கொள்கைகளை சேவை நிலைத் தேர்வில் பயன்படுத்த முடியும்

## உள்ளடக்க அட்டவணை

- [SKUகளைப் புரிந்துகொள்வது](../../../../docs/pre-deployment)
- [சூழல் அடிப்படையிலான தேர்வு](../../../../docs/pre-deployment)
- [சேவை-சிறப்பு வழிகாட்டிகள்](../../../../docs/pre-deployment)
- [செலவுக் குறைப்பு உத்திகள்](../../../../docs/pre-deployment)
- [செயல்திறன் கருத்துக்கள்](../../../../docs/pre-deployment)
- [விரைவான குறிப்புகளுக்கான அட்டவணைகள்](../../../../docs/pre-deployment)
- [சரிபார்ப்பு கருவிகள்](../../../../docs/pre-deployment)

---

## SKUகளைப் புரிந்துகொள்வது

### SKUக்கள் என்றால் என்ன?

SKUக்கள் (Stock Keeping Units) என்பது Azure வளங்களுக்கான வெவ்வேறு சேவை நிலைகள் மற்றும் செயல்திறன் அளவுகளை குறிக்கின்றன. ஒவ்வொரு SKUவும் வெவ்வேறு அம்சங்களை வழங்குகிறது:

- **செயல்திறன் பண்புகள்** (CPU, நினைவகம், துளைபுகு திறன்)
- **அம்சங்களின் கிடைக்கும் தன்மை** (விரிவாக்க விருப்பங்கள், SLA நிலைகள்)
- **விலை மாதிரிகள்** (நுகர்வு அடிப்படையிலானது, முன்பதிவு திறன்)
- **பிராந்திய கிடைக்கும் தன்மை** (அனைத்து SKUக்களும் அனைத்து பிராந்தியங்களிலும் கிடைக்காது)

### SKU தேர்வில் முக்கிய காரணிகள்

1. **பணிச்சுமை தேவைகள்**
   - எதிர்பார்க்கப்படும் போக்குவரத்து/சுமை முறை
   - செயல்திறன் தேவைகள் (CPU, நினைவகம், I/O)
   - சேமிப்பு தேவைகள் மற்றும் அணுகல் முறைகள்

2. **சூழல் வகை**
   - மேம்பாடு/சோதனை மற்றும் உற்பத்தி
   - கிடைக்கும் தேவைகள்
   - பாதுகாப்பு மற்றும் இணக்கத்தன்மை தேவைகள்

3. **பட்ஜெட் கட்டுப்பாடுகள்**
   - ஆரம்ப செலவுகள் மற்றும் செயல்பாட்டு செலவுகள்
   - முன்பதிவு திறன் தள்ளுபடிகள்
   - தானியங்கி-விரிவாக்க செலவுகளின் தாக்கங்கள்

4. **வளர்ச்சி முன்னறிவிப்பு**
   - விரிவாக்க தேவைகள்
   - எதிர்கால அம்ச தேவைகள்
   - இடமாற்ற சிக்கல்களும்

---

## சூழல் அடிப்படையிலான தேர்வு

### மேம்பாட்டு சூழல்

**முக்கியம்**: செலவுக் குறைப்பு, அடிப்படை செயல்பாடு, எளிய ஏற்பாடு/அகற்றல்

#### பரிந்துரைக்கப்பட்ட SKUக்கள்
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
- **App Service**: எளிய சோதனைக்கு F1 (இலவசம்) அல்லது B1 (அடிப்படை)
- **தரவுத்தொகுப்புகள்**: குறைந்த வளங்களுடன் அடிப்படை நிலை
- **சேமிப்பு**: உள்ளூர் மீள்நிரப்பு மட்டுமே கொண்ட நிலையானது
- **கணினி**: பகிரப்பட்ட வளங்கள் போதுமானவை
- **நெட்வொர்க்**: அடிப்படை அமைப்புகள்

### பரிசோதனை/சோதனை சூழல்

**முக்கியம்**: உற்பத்தி போன்ற அமைப்பு, செலவுக் சமநிலை, செயல்திறன் சோதனை திறன்

#### பரிந்துரைக்கப்பட்ட SKUக்கள்
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
- **செயல்திறன்**: உற்பத்தி திறனின் 70-80%
- **அம்சங்கள்**: பெரும்பாலான உற்பத்தி அம்சங்கள் இயக்கப்பட்டுள்ளன
- **மீள்நிரப்பு**: சில புவியியல் மீள்நிரப்பு
- **விரிவாக்கம்**: சோதனைக்காக வரையறுக்கப்பட்ட தானியங்கி-விரிவாக்கம்
- **கண்காணிப்பு**: முழுமையான கண்காணிப்பு அமைப்பு

### உற்பத்தி சூழல்

**முக்கியம்**: செயல்திறன், கிடைக்கும் தன்மை, பாதுகாப்பு, இணக்கத்தன்மை, விரிவாக்கம்

#### பரிந்துரைக்கப்பட்ட SKUக்கள்
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
- **உயர் கிடைக்கும் தன்மை**: 99.9%+ SLA தேவைகள்
- **செயல்திறன்**: தனித்துவமான வளங்கள், உயர் துளைபுகு திறன்
- **பாதுகாப்பு**: பிரீமியம் பாதுகாப்பு அம்சங்கள்
- **விரிவாக்கம்**: முழுமையான தானியங்கி-விரிவாக்க திறன்கள்
- **கண்காணிப்பு**: விரிவான கண்காணிப்பு

---

## சேவை-சிறப்பு வழிகாட்டிகள்

### Azure App Service

#### SKU முடிவு அட்டவணை

| பயன்பாடு | பரிந்துரைக்கப்பட்ட SKU | காரணம் |
|----------|----------------|-----------|
| மேம்பாடு/சோதனை | F1 (இலவசம்) அல்லது B1 (அடிப்படை) | செலவுச்செலவானது, சோதனைக்கு போதுமானது |
| சிறிய உற்பத்தி பயன்பாடுகள் | S1 (தரநிலை) | தனிப்பட்ட டொமைன்கள், SSL, தானியங்கி-விரிவாக்கம் |
| நடுத்தர உற்பத்தி பயன்பாடுகள் | P1V3 (பிரீமியம் V3) | மேம்பட்ட செயல்திறன், கூடுதல் அம்சங்கள் |
| உயர் போக்குவரத்து பயன்பாடுகள் | P2V3 அல்லது P3V3 | தனித்துவமான வளங்கள், உயர் செயல்திறன் |
| மிக முக்கியமான பயன்பாடுகள் | I1V2 (தனிமைப்படுத்தப்பட்ட V2) | நெட்வொர்க் தனிமை, தனித்துவமான ஹார்ட்வேர் |

#### அமைப்பு எடுத்துக்காட்டுகள்

**மேம்பாடு**
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

**உற்பத்தி**
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

### Azure SQL தரவுத்தொகுப்பு

#### SKU தேர்வு அமைப்பு

1. **DTU அடிப்படையிலானது (தரவுத்தொகுப்பு பரிமாற்ற அலகுகள்)**
   - **அடிப்படை**: 5 DTU - மேம்பாடு/சோதனை
   - **தரநிலை**: S0-S12 (10-3000 DTU) - பொது நோக்கம்
   - **பிரீமியம்**: P1-P15 (125-4000 DTU) - செயல்திறன் முக்கியமானது

2. **vCore அடிப்படையிலானது** (உற்பத்திக்காக பரிந்துரைக்கப்படுகிறது)
   - **பொது நோக்கம்**: சமநிலை கணினி மற்றும் சேமிப்பு
   - **வணிக முக்கியத்துவம்**: குறைந்த தாமதம், உயர் IOPS
   - **Hyperscale**: மிக அதிக அளவிலான சேமிப்பு (100TB வரை)

#### எடுத்துக்காட்டு அமைப்புகள்

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

1. **நுகர்வு அடிப்படையிலானது**
   - பயன்படுத்தும் அளவுக்கு செலுத்தும் விலை
   - மேம்பாடு மற்றும் மாறும் பணிச்சுமைகளுக்கு பொருத்தமானது
   - பகிரப்பட்ட உள்கட்டமைப்பு

2. **தனித்துவமானது (பணிச்சுமை சுயவிவரங்கள்)**
   - தனித்துவமான கணினி வளங்கள்
   - கணிக்கக்கூடிய செயல்திறன்
   - உற்பத்தி பணிச்சுமைகளுக்கு சிறந்தது

#### அமைப்பு எடுத்துக்காட்டுகள்

**மேம்பாடு (நுகர்வு)**
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

**உற்பத்தி (தனித்துவமானது)**
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

#### துளைபுகு மாதிரிகள்

1. **கையேடு வழங்கப்பட்ட துளைபுகு**
   - கணிக்கக்கூடிய செயல்திறன்
   - முன்பதிவு திறன் தள்ளுபடிகள்
   - நிலையான பணிச்சுமைகளுக்கு சிறந்தது

2. **தானியங்கி-விரிவாக்கம் வழங்கப்பட்ட துளைபுகு**
   - பயன்பாட்டின் அடிப்படையில் தானியங்கி விரிவாக்கம்
   - நீங்கள் பயன்படுத்தும் அளவுக்கு செலுத்துங்கள் (குறைந்தபட்சத்துடன்)
   - மாறும் பணிச்சுமைகளுக்கு சிறந்தது

3. **சர்வர் இல்லாதது**
   - கோரிக்கைக்கு செலுத்துங்கள்
   - வழங்கப்பட்ட துளைபுகு இல்லை
   - மேம்பாடு மற்றும் இடைவிடாத பணிச்சுமைகளுக்கு சிறந்தது

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

### Azure சேமிப்பு கணக்கு

#### சேமிப்பு கணக்கு வகைகள்

1. **Standard_LRS** - மேம்பாடு, முக்கியமற்ற தரவுகள்
2. **Standard_GRS** - உற்பத்தி, புவியியல் மீள்நிரப்பு தேவை
3. **Premium_LRS** - உயர் செயல்திறன் பயன்பாடுகள்
4. **Premium_ZRS** - மண்டல மீள்நிரப்பத்துடன் உயர் கிடைக்கும் தன்மை

#### செயல்திறன் நிலைகள்

- **தரநிலை**: பொது நோக்கம், செலவுச்செலவானது
- **பிரீமியம்**: உயர் செயல்திறன், குறைந்த தாமதமான சூழல்கள்

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

## செலவுக் குறைப்பு உத்திகள்

### 1. முன்பதிவு திறன்

1-3 ஆண்டுகளுக்கு வளங்களை முன்பதிவு செய்து முக்கியமான தள்ளுபடிகளைப் பெறுங்கள்:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. சரியான அளவீடு

சிறிய SKUக்களுடன் தொடங்கி, உண்மையான பயன்பாட்டின் அடிப்படையில் விரிவாக்குங்கள்:

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

### 3. தானியங்கி-விரிவாக்க அமைப்பு

செலவுகளை குறைக்க புத்திசாலித்தனமான விரிவாக்கத்தை செயல்படுத்துங்கள்:

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

### 4. திட்டமிட்ட விரிவாக்கம்

ஆஃப்-அவர்களில் விரிவாக்கத்தை குறைக்கவும்:

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

## செயல்திறன் கருத்துக்கள்

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

### சுமை சோதனை

செயல்திறனை சரிபார்க்க வெவ்வேறு SKUக்களை சோதிக்கவும்:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### கண்காணிப்பு மற்றும் மேம்பாடு

விரிவான கண்காணிப்பை அமைக்கவும்:

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

## விரைவான குறிப்புகளுக்கான அட்டவணைகள்

### App Service SKU விரைவான குறிப்புகள்

| SKU | நிலை | vCPU | RAM | சேமிப்பு | விலை வரம்பு | பயன்பாடு |
|-----|------|------|-----|---------|-------------|----------|
| F1 | இலவசம் | பகிரப்பட்டது | 1GB | 1GB | இலவசம் | மேம்பாடு |
| B1 | அடிப்படை | 1 | 1.75GB | 10GB | $ | சிறிய பயன்பாடுகள் |
| S1 | தரநிலை | 1 | 1.75GB | 50GB | $$ | உற்பத்தி |
| P1V3 | பிரீமியம் V3 | 2 | 8GB | 250GB | $$$ | உயர் செயல்திறன் |
| I1V2 | தனிமைப்படுத்தப்பட்ட V2 | 2 | 8GB | 1TB | $$$$ | நிறுவன |

### SQL தரவுத்தொகுப்பு SKU விரைவான குறிப்புகள்

| SKU | நிலை | DTU/vCore | சேமிப்பு | விலை வரம்பு | பயன்பாடு |
|-----|------|-----------|---------|-------------|----------|
| Basic | அடிப்படை | 5 DTU | 2GB | $ | மேம்பாடு |
| S2 | தரநிலை | 50 DTU | 250GB | $$ | சிறிய உற்பத்தி |
| P2 | பிரீமியம் | 250 DTU | 1TB | $$$ | உயர் செயல்திறன் |
| GP_Gen5_4 | பொது நோக்கம் | 4 vCore | 4TB | $$$ | சமநிலை |
| BC_Gen5_8 | வணிக முக்கியத்துவம் | 8 vCore | 4TB | $$$$ | மிக முக்கியம் |

### Container Apps SKU விரைவான குறிப்புகள்

| மாதிரி | விலை | CPU/நினைவகம் | பயன்பாடு |
|-------|---------|------------|----------|
| நுகர்வு | பயன்படுத்தும் அளவுக்கு செலுத்துங்கள் | 0.25-2 vCPU | மேம்பாடு, மாறும் சுமை |
| Dedicated D4 | முன்பதிவு | 4 vCPU, 16GB | உற்பத்தி |
| Dedicated D8 | முன்பதிவு | 8 vCPU, 32GB | உயர் செயல்திறன் |

---

## சரிபார்ப்பு கருவிகள்

### SKU கிடைக்கும் தன்மை சரிபார்ப்பான்

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

### செலவீன மதிப்பீடு ஸ்கிரிப்ட்

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

1. **சிறியதாக தொடங்கி, உண்மையான பயன்பாட்டின் அடிப்படையில் விரிவாக்குங்கள்**
2. **வெவ்வேறு சூழல்களுக்கு வெவ்வேறு SKUக்களை பயன்படுத்துங்கள்**
3. **செயல்திறன் மற்றும் செலவுகளை தொடர்ந்து கண்காணிக்கவும்**
4. **உற்பத்தி பணிச்சுமைகளுக்கு முன்பதிவு திறனை பயன்படுத்துங்கள்**
5. **தேவையான இடங்களில் தானியங்கி-விரிவாக்கத்தை செயல்படுத்துங்கள்**
6. **உண்மையான பணிச்சுமைகளுடன் செயல்திறனை சோதிக்கவும்**
7. **வளர்ச்சியை திட்டமிடுங்கள் ஆனால் அதிக அளவுக்கு வழங்க வேண்டாம்**
8. **இலவச நிலைகளை மேம்பாட்டுக்கு பயன்படுத்துங்கள்**

### செய்ய வேண்டாதவை

1. **மேம்பாட்டுக்கு உற்பத்தி SKUக்களை பயன்படுத்த வேண்டாம்**
2. **பிராந்திய SKU கிடைக்கும் தன்மையை புறக்கணிக்க வேண்டாம்**
3. **தரவு பரிமாற்ற செலவுகளை மறக்க வேண்டாம்**
4. **நியாயமில்லாமல் அதிக அளவுக்கு வழங்க வேண்டாம்**
5. **சார்ந்தவற்றின் தாக்கத்தை புறக்கணிக்க வேண்டாம்**
6. **தானியங்கி-விரிவாக்க வரம்புகளை மிக அதிகமாக அமைக்க வேண்டாம்**
7. **இணக்கத்தன்மை தேவைகளை மறக்க வேண்டாம்**
8. **விலையை மட்டுமே அடிப்படையாகக் கொண்டு முடிவுகளை எடுக்க வேண்டாம்**

---

**சிறந்த அறிவுரை**: உங்கள் SKU தேர்வுகளை மேம்படுத்த, Azure செலவுக் மேலாண்மை மற்றும் ஆலோசகரை பயன்படுத்தி, உண்மையான பயன்பாட்டு மாதிரிகளின் அடிப்பட

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கின்றோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.